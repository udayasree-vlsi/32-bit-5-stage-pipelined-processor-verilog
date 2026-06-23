`timescale 1ns / 1ps
module BranchControl_tb;

reg branch;
reg zero;

wire pc_src;
wire flush;

BranchControl dut(
    .branch(branch),
    .zero(zero),
    .pc_src(pc_src),
    .flush(flush)
);

initial begin

    branch = 0; zero = 0;
    #10;

    branch = 1; zero = 0;
    #10;

    branch = 1; zero = 1;
    #10;

    branch = 0; zero = 1;
    #10;

    $finish;

end

endmodule