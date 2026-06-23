module InstructionMemory(
    input [31:0] addr,
    output [31:0] instruction
);

reg [31:0] memory [0:255];

integer i;

initial begin

    for(i=0; i<256; i=i+1)
        memory[i] = 32'h00000000;

    memory[0]  = 32'h00430820;
    memory[1]  = 32'h00431020;
    memory[2]  = 32'h00431820;
    memory[3]  = 32'h8C010000;
    memory[4]  = 32'hAC010004;
    memory[5]  = 32'h10210001;
    memory[6]  = 32'h00432020;
    memory[7]  = 32'h0043282A;
    memory[8]  = 32'h00433026;
    memory[9]  = 32'h00433825;
    memory[10] = 32'h00434024;

end

assign instruction = memory[addr[9:2]];

endmodule