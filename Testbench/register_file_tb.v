`timescale 1ns/1ps

module RegisterFile_tb;

reg clk;
reg RegWrite;

reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;

reg [31:0] write_data;

wire [31:0] read_data1;
wire [31:0] read_data2;

RegisterFile uut(
    .clk(clk),
    .RegWrite(RegWrite),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .write_data(write_data),

    .read_data1(read_data1),
    .read_data2(read_data2)
);

// Clock
always #5 clk = ~clk;

initial
begin

    clk = 0;
    RegWrite = 0;

    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    write_data = 0;

    // Read initial registers
    #10;
    rs1 = 1;
    rs2 = 2;

    // Write 100 into R5
    #10;
    RegWrite = 1;
    rd = 5;
    write_data = 100;

    #10;
    RegWrite = 0;

    // Read R5
    #10;
    rs1 = 5;

    // Write 200 into R6
    #10;
    RegWrite = 1;
    rd = 6;
    write_data = 200;

    #10;
    RegWrite = 0;

    // Read R5 and R6
    #10;
    rs1 = 5;
    rs2 = 6;

    #20;
    $finish;

end

initial
begin
    $monitor(
    "TIME=%0t RegWrite=%b rs1=%d rs2=%d rd=%d write_data=%d read1=%d read2=%d",
    $time,
    RegWrite,
    rs1,
    rs2,
    rd,
    write_data,
    read_data1,
    read_data2
    );
end

endmodule