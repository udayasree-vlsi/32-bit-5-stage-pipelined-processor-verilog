module DataMemory(
    input clk,
    input mem_read,
    input mem_write,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
);

reg [31:0] memory [0:255];

integer i;

initial
begin
    for(i=0;i<256;i=i+1)
        memory[i] = 32'd0;

    // Initial data for LW testing
    memory[0] = 32'd100;
    memory[1] = 32'd200;
    memory[2] = 32'd300;
end

// Write Operation
always @(posedge clk)
begin
    if(mem_write)
    begin
        memory[address[9:2]] <= write_data;

        $display("STORE : Time=%0t Address=%d Data=%d",
                 $time,
                 address,
                 write_data);
    end
end

// Read Operation
always @(*)
begin
    if(mem_read)
    begin
        read_data = memory[address[9:2]];

        $display("LOAD  : Time=%0t Address=%d Data=%d",
                 $time,
                 address,
                 memory[address[9:2]]);
    end
    else
        read_data = 32'd0;
end

endmodule