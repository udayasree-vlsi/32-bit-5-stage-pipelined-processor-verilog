module ALU_Control(

    input [1:0] alu_op,
    input [5:0] funct,
    output reg [2:0] alu_sel

);

always @(*) begin

    case(alu_op)

        2'b00:
            alu_sel = 3'b000; // ADD (LW/SW)

        2'b01:
            alu_sel = 3'b001; // SUB (BEQ)

        2'b10:
        begin
            case(funct)

                6'h20: alu_sel = 3'b000; // ADD
                6'h22: alu_sel = 3'b001; // SUB
                6'h24: alu_sel = 3'b010; // AND
                6'h25: alu_sel = 3'b011; // OR
                6'h26: alu_sel = 3'b100; // XOR
                6'h2A: alu_sel = 3'b101; // SLT

                default:
                    alu_sel = 3'b000;

            endcase
        end

        default:
            alu_sel = 3'b000;

    endcase

end

endmodule