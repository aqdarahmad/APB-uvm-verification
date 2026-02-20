import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_transaction extends uvm_sequence_item;

    rand bit [7:0] addr;
    rand bit [7:0] data;
    rand bit       write;

    `uvm_object_utils(apb_transaction)

    function new(string name="apb_transaction");
        super.new(name);
    endfunction

endclass