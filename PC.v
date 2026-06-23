module PC(
    input clk,
    input reset,
    input pc_write,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc_out <= 32'd0;
    else if(pc_write)
        pc_out <= pc_out + 32'd4;
end

endmodule