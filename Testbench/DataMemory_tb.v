`timescale 1ns / 1ps
`timescale 1ns/1ps

module DataMemory_tb;

reg clk;
reg mem_read;
reg mem_write;

reg [31:0] address;
reg [31:0] write_data;

wire [31:0] read_data;

DataMemory uut(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    mem_read = 0;
    mem_write = 0;
    address = 0;
    write_data = 0;

    // Read memory[0]
    #10;
    mem_read = 1;
    address = 0;

    // Write 500 to memory[1]
    #10;
    mem_read = 0;
    mem_write = 1;
    address = 1;
    write_data = 500;

    // Read memory[1]
    #10;
    mem_write = 0;
    mem_read = 1;
    address = 1;

    #20;
    $stop;

end

endmodule