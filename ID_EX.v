module ID_EX(
    input clk,
    input reset,

    input [31:0] read_data1_in,
    input [31:0] read_data2_in,

    input [4:0] rs1_in,
    input [4:0] rs2_in,
    input [4:0] rd_in,
    input [5:0] funct_in,
    input [1:0] alu_op_in,

    input reg_write_in,
    input mem_read_in,
    input mem_write_in,

    output reg [31:0] read_data1_out,
    output reg [31:0] read_data2_out,

    output reg [4:0] rs1_out,
    output reg [4:0] rs2_out,
    output reg [4:0] rd_out,

    output reg [1:0] alu_op_out,
    output reg [5:0] funct_out,

    output reg reg_write_out,
    output reg mem_read_out,
    output reg mem_write_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
    read_data1_out <= 0;
    read_data2_out <= 0;

    rs1_out <= 0;
    rs2_out <= 0;
    rd_out  <= 0;

    funct_out <= 0;

    alu_op_out <= 0;

    reg_write_out <= 0;
    mem_read_out <= 0;
    mem_write_out <= 0;
    end
    else
    begin
    read_data1_out <= read_data1_in;
    read_data2_out <= read_data2_in;

    rs1_out <= rs1_in;
    rs2_out <= rs2_in;
    rd_out  <= rd_in;

    funct_out <= funct_in;

    alu_op_out <= alu_op_in;

    reg_write_out <= reg_write_in;
    mem_read_out <= mem_read_in;
    mem_write_out <= mem_write_in;
    end
end

endmodule