`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 23:11:10
// Design Name: 
// Module Name: aluu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aluu_tb;
reg [31:0] A;
reg [31:0] B;
reg [2:0] sel;
wire [31:0] Y;
aluu uut(
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);
initial
begin
    // ADD
    A = 32'd10;
    B = 32'd5;
    sel = 3'b000;
    #10;
    // SUB
    sel = 3'b001;
    #10;
    // AND
    A = 32'hF0F0F0F0;
    B = 32'h0F0F0F0F;
    sel = 3'b010;
    #10;
    // OR
    sel = 3'b011;
    #10;
    // XOR
    A = 32'hAAAA5555;
    B = 32'h5555AAAA;
    sel = 3'b100;
    #10;
    $finish;
end
endmodule
