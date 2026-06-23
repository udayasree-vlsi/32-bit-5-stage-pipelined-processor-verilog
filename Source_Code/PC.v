`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module PC (
    input clk,
    input reset,
    input [31:0] next_pc,
    output reg [31:0] pc
);
wire [31:0] next_pc;

// PC + 4 logic
assign next_pc = pc + 4;

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 0;
    else
        pc <= next_pc;
      
end

endmodule
