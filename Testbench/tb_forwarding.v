module tb_forwarding;
reg [4:0] rs1_ex;
reg [4:0] rs2_ex;
reg [4:0] rd_mem;
reg [4:0] rd_wb;
reg reg_write_mem;
reg reg_write_wb;
wire [1:0] forwardA;
wire [1:0] forwardB;
ForwardingUnit uut(
    .rs1_ex(rs1_ex),
    .rs2_ex(rs2_ex),
    .rd_mem(rd_mem),
    .rd_wb(rd_wb),
    .reg_write_mem(reg_write_mem),
    .reg_write_wb(reg_write_wb),
    .forwardA(forwardA),
    .forwardB(forwardB)
);
initial begin
    rs1_ex = 5'd1;
    rs2_ex = 5'd2;
    rd_mem = 5'd1;
    rd_wb = 5'd0;
    reg_write_mem = 1;
    reg_write_wb = 0;
    #10;
    rd_mem = 5'd0;
    rd_wb = 5'd2;
    reg_write_mem = 0;
    reg_write_wb = 1;
    #10;
    $finish;
end
endmodule