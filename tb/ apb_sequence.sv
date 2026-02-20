import uvm_pkg::*;
`include "uvm_macros.svh"

class apb_sequence extends uvm_sequence #(apb_transaction);
  `uvm_object_utils(apb_sequence)

  function new(string name = "apb_sequence");
    super.new(name);
  endfunction

  // Body task: generate transactions
  virtual task body();
    apb_transaction tr;
    repeat(10) begin
      tr = apb_transaction::type_id::create("tr");
      assert(tr.randomize());
      start_item(tr);
      finish_item(tr);
    end
  endtask
endclass