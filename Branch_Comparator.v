module Branch_Comparator(
    input [31:0] A,
    input [31:0] B,

    output branch_taken
);

assign branch_taken = (A == B) ? 1'b1 : 1'b0;
endmodule