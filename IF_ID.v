module IF_ID(
    input clk,
    input reset,

    input ifid_write,
    input flush,

    input [31:0] instruction_in,
    input [31:0] pc_in,

    output reg [31:0] instruction_out,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        instruction_out <= 32'd0;
        pc_out <= 32'd0;
    end

    else if(flush)
    begin
        instruction_out <= 32'd0;
        pc_out <= 32'd0;
    end

    else if(ifid_write)
    begin
        instruction_out <= instruction_in;
        pc_out <= pc_in;
    end
end

endmodule