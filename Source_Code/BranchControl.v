module BranchControl(

    input branch,
    input zero,

    output pc_src,
    output flush

);

assign pc_src = branch & zero;
assign flush  = branch & zero;

endmodule