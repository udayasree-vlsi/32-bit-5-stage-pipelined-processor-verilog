module Hazard_Detection_tb;

reg mem_read_ex;
reg [4:0] rd_ex;
reg [4:0] rs1_id;
reg [4:0] rs2_id;

wire stall;

Hazard_Detection uut(
    .mem_read_ex(mem_read_ex),
    .rd_ex(rd_ex),
    .rs1_id(rs1_id),
    .rs2_id(rs2_id),
    .stall(stall)
);

initial
begin

    mem_read_ex = 1;
    rd_ex  = 5'd1;
    rs1_id = 5'd1;
    rs2_id = 5'd2;

    #10;

    mem_read_ex = 1;
    rd_ex  = 5'd3;
    rs1_id = 5'd1;
    rs2_id = 5'd2;

    #10;

    $finish;
end
endmodule