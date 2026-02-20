import uvm_pkg::*;
`include "uvm_macros.svh"
module top;

   

    logic PCLK;
    always #5 PCLK = ~PCLK;

    apb_if vif(PCLK);

    apb_slave dut(
        .PCLK(PCLK),
        .PRESETn(vif.PRESETn),
        .PSEL(vif.PSEL),
        .PENABLE(vif.PENABLE),
        .PWRITE(vif.PWRITE),
        .PADDR(vif.PADDR),
        .PWDATA(vif.PWDATA),
        .PRDATA(vif.PRDATA),
        .PREADY(vif.PREADY)
    );

    initial begin
        vif.PRESETn = 0;
        #20;
        vif.PRESETn = 1;
    end

    initial begin
        uvm_config_db#(virtual apb_if)::set(null,"*","vif",vif);
        run_test("apb_test");
    end

endmodule