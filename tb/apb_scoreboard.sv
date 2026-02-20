import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_scoreboard extends uvm_component;

    `uvm_component_utils(apb_scoreboard)
    uvm_analysis_imp #(apb_transaction, apb_scoreboard) imp;

    bit [7:0] model [0:3];

    function new(string name, uvm_component parent);
        super.new(name,parent);
        imp = new("imp", this);
    endfunction

    function void write(apb_transaction tr);
        if(tr.write)
            model[tr.addr[1:0]] = tr.data;
        else begin
            if(model[tr.addr[1:0]] != tr.data)
                `uvm_error("MISMATCH","Read data mismatch")
        end
    endfunction
endclass