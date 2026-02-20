interface apb_if(input logic PCLK);

    logic PRESETn;
    logic [7:0] PADDR;
    logic [7:0] PWDATA;
    logic [7:0] PRDATA;
    logic PWRITE;
    logic PSEL;
    logic PENABLE;
    logic PREADY;

endinterface