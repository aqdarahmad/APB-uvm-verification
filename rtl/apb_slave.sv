module apb_slave (
    input  logic        PCLK,
    input  logic        PRESETn,
    input  logic        PSEL,
    input  logic        PENABLE,
    input  logic        PWRITE,
    input  logic [7:0]  PADDR,
    input  logic [7:0]  PWDATA,
    output logic [7:0]  PRDATA,
    output logic        PREADY
);

logic [7:0] mem [0:3];   // 4 registers

assign PREADY = 1'b1;

always_ff @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn) begin
        mem[0] <= 0;
        mem[1] <= 0;
        mem[2] <= 0;
        mem[3] <= 0;
    end
    else if (PSEL && PENABLE && PWRITE) begin
        mem[PADDR[1:0]] <= PWDATA;
    end
end

always_comb begin
    if (PSEL && PENABLE && !PWRITE)
        PRDATA = mem[PADDR[1:0]];
    else
        PRDATA = 0;
end

endmodule