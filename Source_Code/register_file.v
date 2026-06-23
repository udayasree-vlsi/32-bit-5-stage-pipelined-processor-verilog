module RegisterFile(

    input clk,
    input RegWrite,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [31:0] write_data,

    output [31:0] read_data1,
    output [31:0] read_data2

);

reg [31:0] registers [31:0];

// Read Ports
assign read_data1 =
       (rs1 == 5'd0) ? 32'd0 : registers[rs1];

assign read_data2 =
       (rs2 == 5'd0) ? 32'd0 : registers[rs2];

// Write Port
always @(posedge clk)
begin
    if(RegWrite && (rd != 5'd0))
        registers[rd] <= write_data;
end

// Initialization (Simulation Only)
integer i;

initial
begin
    for(i = 0; i < 32; i = i + 1)
        registers[i] = 32'd0;

    registers[1] = 32'd10;
    registers[2] = 32'd20;
    registers[3] = 32'd30;
    registers[4] = 32'd40;
end

endmodule