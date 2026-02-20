import uvm_pkg::*;
`include "uvm_macros.svh"

class apb_test extends uvm_test;
  `uvm_component_utils(apb_test) 

  // Environment handle
  apb_env env;

  // Constructor
  function new(string name = "apb_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  // Build phase: create environment
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = apb_env::type_id::create("env", this);
  endfunction

  // Run phase: generate transactions
  task run_phase(uvm_phase phase);
    apb_sequence seq;
    phase.raise_objection(this);

    // Create sequence
    seq = apb_sequence::type_id::create("seq");

    // Start the sequence on the sequencer
    seq.start(env.agent.seqr);  

    phase.drop_objection(this);
  endtask
endclass