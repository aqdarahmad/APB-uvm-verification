import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_driver extends uvm_driver #(apb_transaction);

    `uvm_component_utils(apb_driver)
    virtual apb_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual apb_if)::get(this,"","vif",vif))
            `uvm_fatal("NOVIF","interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        apb_transaction tr;

        forever begin
            seq_item_port.get_next_item(tr);

            // SETUP
            vif.PSEL    <= 1;
            vif.PADDR   <= tr.addr;
            vif.PWRITE  <= tr.write;
            vif.PWDATA  <= tr.data;
            vif.PENABLE <= 0;

            @(posedge vif.PCLK);

            // ACCESS
            vif.PENABLE <= 1;
            wait(vif.PREADY);

            @(posedge vif.PCLK);

            // IDLE
            vif.PSEL    <= 0;
            vif.PENABLE <= 0;

            seq_item_port.item_done();
        end
    endtask
endclass