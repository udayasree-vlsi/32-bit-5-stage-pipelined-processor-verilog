module ForwardingUnit(
    input [4:0] rs1_ex,
    input [4:0] rs2_ex,

    input [4:0] rd_mem,
    input [4:0] rd_wb,

    input reg_write_mem,
    input reg_write_wb,

    output reg [1:0] forwardA,
    output reg [1:0] forwardB
);

always @(*) begin

    // Default = NO forwarding
    forwardA = 2'b00;
    forwardB = 2'b00;

    // EX/MEM forwarding
    if(reg_write_mem &&
       (rd_mem != 0) &&
       (rd_mem == rs1_ex))
        forwardA = 2'b10;

    if(reg_write_mem &&
       (rd_mem != 0) &&
       (rd_mem == rs2_ex))
        forwardB = 2'b10;

    // MEM/WB forwarding
    if(reg_write_wb &&
       (rd_wb != 0) &&
       !(reg_write_mem &&
         (rd_mem != 0) &&
         (rd_mem == rs1_ex)) &&
       (rd_wb == rs1_ex))
        forwardA = 2'b01;

    if(reg_write_wb &&
       (rd_wb != 0) &&
       !(reg_write_mem &&
         (rd_mem != 0) &&
         (rd_mem == rs2_ex)) &&
       (rd_wb == rs2_ex))
        forwardB = 2'b01;

end

endmodule