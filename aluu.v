`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2026 23:05:28
// Design Name: 
// Module Name: aluu
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


module aluu (
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  sel,

    output reg [31:0] Y
);

always @(*) begin
    case(sel)

        3'b000: Y = A + B;                       // ADD

        3'b001: Y = A - B;                       // SUB

        3'b010: Y = A & B;                       // AND

        3'b011: Y = A | B;                       // OR

        3'b100: Y = A ^ B;                       // XOR

        3'b101: Y = (A < B) ? 32'd1 : 32'd0;    // SLT

        default: Y = 32'd0;

    endcase
end

endmodule