import uvm_pkg::*;
 `include "uvm_macros.svh"
 class apb_test extends uvm_test;
 `uvm_component_utils(apb_test) 
    apb_env env;
 function new(string name, uvm_component parent);
 super.new(name,parent);
 endfunction
 function void build_phase(uvm_phase phase);
 env = apb_env::type_id::create("env",this);
    endfunction

 task run_phase(uvm_phase phase);
 apb_transaction tr;
 phase.raise_objection(this); 
repeat(10) begin 
 tr = apb_transaction::type_id::create("tr");
assert(tr.randomize());
 env.agent.seqr.start_item(tr); 
env.agent.seqr.finish_item(tr); 
end 
        phase.drop_objection(this);
 endtask 
endclass
