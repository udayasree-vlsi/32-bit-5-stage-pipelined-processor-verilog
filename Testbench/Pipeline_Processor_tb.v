module Pipeline_Processor_tb;

reg clk;
reg reset;

Pipeline_Processor dut(
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    #20;
    reset = 0;

    #300;

    $finish;
end

endmodule