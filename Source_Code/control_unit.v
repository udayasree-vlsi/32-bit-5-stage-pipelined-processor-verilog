module control_unit(
    input [5:0] opcode,

    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg [1:0] alu_op,
    output reg branch
);

always @(*)
begin

    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;
    alu_src   = 0;
    alu_op    = 2'b00;
    branch    = 0;

    case(opcode)

        6'b000000:
        begin
            reg_write = 1;
            alu_op = 2'b10;
        end

        6'b100011:
        begin
            reg_write = 1;
            mem_read = 1;
            alu_src = 1;
            alu_op = 2'b00;
        end

        6'b101011:
        begin
            mem_write = 1;
            alu_src = 1;
            alu_op = 2'b00;
        end

        6'b000100:
        begin
            branch = 1;
            alu_op = 2'b01;
        end

    endcase
end

endmodule