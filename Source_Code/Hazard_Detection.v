module Hazard_Detection(
    input mem_read_ex,
    input [4:0] rd_ex,
    input [4:0] rs1_id,
    input [4:0] rs2_id,

    output reg stall
);

always @(*)
begin
   if(mem_read_ex &&
   (rd_ex != 0) &&
   ((rd_ex == rs1_id) ||
    (rd_ex == rs2_id)))
        stall = 1'b1;
    else
        stall = 1'b0;
end

endmodule