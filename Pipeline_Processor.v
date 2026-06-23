module Pipeline_Processor(
    input clk,
    input reset
);
// IF Stage
//=====================
wire [31:0] pc_out;
wire [31:0] instruction;
wire pc_write;
wire ifid_write;

PC pc1(
    .clk(clk),
    .reset(reset),
    .pc_write(pc_write),
    .pc_out(pc_out)
);
InstructionMemory imem(
    .addr(pc_out),
    .instruction(instruction)
);
//=====================
// IF/ID
//=====================
wire [31:0] ifid_instruction;
wire [31:0] ifid_pc;
wire flush;
IF_ID ifid(
    .clk(clk),
    .reset(reset),

    .ifid_write(ifid_write),
    .flush(flush),

    .instruction_in(instruction),
    .pc_in(pc_out),

    .instruction_out(ifid_instruction),
    .pc_out(ifid_pc)
);
wire stall;


assign pc_write  = ~stall;
assign ifid_write = ~stall;

wire branch_taken;
wire pc_src;
wire branch;
//=====================
// ID Stage
//=====================
wire [5:0] opcode;
wire [5:0] funct;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;


Decoder dec(
    .instruction(ifid_instruction),
    .opcode(opcode),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .funct(funct)
);
wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire [1:0] alu_op;
control_unit cu(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .alu_op(alu_op),
    .branch(branch)
);
//=====================
// Register File
//=====================
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] memwb_mem_data;
wire [31:0] memwb_alu_result;
wire [4:0]  memwb_rd;
wire        memwb_reg_write;
wire [31:0] wb_data;
wire memwb_mem_read;
wire mem_to_reg;
assign mem_to_reg = memwb_mem_read;

RegisterFile rf(
    .clk(clk),
    .RegWrite(memwb_reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(memwb_rd),
    .write_data(wb_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
//=====================
// ID/EX
//=====================
wire [31:0] idex_read_data1;
wire [31:0] idex_read_data2;
wire [4:0] idex_rd;
wire [1:0] idex_alu_op;
wire idex_reg_write;
wire idex_mem_read;
wire idex_mem_write;
wire [4:0] idex_rs1;
wire [4:0] idex_rs2;
wire [5:0] idex_funct;
ID_EX idex(
    .clk(clk),
    .reset(reset),

    .read_data1_in(read_data1),
    .read_data2_in(read_data2),

    .rs1_in(rs1),
    .rs2_in(rs2),
    .rd_in(rd),

    .alu_op_in(alu_op),

    .reg_write_in(reg_write),
    .mem_read_in(mem_read),
    .mem_write_in(mem_write),

    .read_data1_out(idex_read_data1),
    .read_data2_out(idex_read_data2),

    .rs1_out(idex_rs1),
    .rs2_out(idex_rs2),
    .rd_out(idex_rd),

    .alu_op_out(idex_alu_op),
    .funct_in(funct),
    .funct_out(idex_funct),

    .reg_write_out(idex_reg_write),
    .mem_read_out(idex_mem_read),
    .mem_write_out(idex_mem_write)
);
wire [1:0] forwardA;
wire [1:0] forwardB;
wire [31:0] exmem_alu_result;
wire [31:0] exmem_write_data;
wire [4:0]  exmem_rd;
wire        exmem_reg_write;
wire        exmem_mem_read;
wire        exmem_mem_write;

ForwardingUnit fu(
    .rs1_ex(idex_rs1),
    .rs2_ex(idex_rs2),

    .rd_mem(exmem_rd),
    .rd_wb(memwb_rd),

    .reg_write_mem(exmem_reg_write),
    .reg_write_wb(memwb_reg_write),

    .forwardA(forwardA),
    .forwardB(forwardB)
);
Hazard_Detection hdu(
    .mem_read_ex(idex_mem_read),
    .rd_ex(idex_rd),

    .rs1_id(rs1),
    .rs2_id(rs2),

    .stall(stall)
);

Branch_Comparator bc(
    .A(read_data1),
    .B(read_data2),
    .branch_taken(branch_taken)
);
BranchControl bctrl(
    .branch(branch),
    .zero(branch_taken),

    .pc_src(pc_src),
    .flush(flush)
);

//=====================
// EX Stage
//=====================

//=====================
// EX Stage
//=====================

wire [2:0] alu_sel;

ALU_Control alu_ctrl(
    .alu_op(idex_alu_op),
    .funct(idex_funct),
    .alu_sel(alu_sel)
);

// Forwarding MUX Logic
reg [31:0] alu_in1;
reg [31:0] alu_in2;
assign wb_data =
       mem_to_reg ?
       memwb_mem_data :
       memwb_alu_result;

always @(*) begin

    case(forwardA)
    2'b00: alu_in1 = idex_read_data1;
    2'b10: alu_in1 = exmem_alu_result;
    2'b01: alu_in1 = wb_data;
    default: alu_in1 = idex_read_data1;
    endcase

    case(forwardB)
    2'b00: alu_in2 = idex_read_data2;
    2'b10: alu_in2 = exmem_alu_result;
    2'b01: alu_in2 = wb_data;
    default: alu_in2 = idex_read_data2;
    endcase
    end
    wire [31:0] alu_result;

aluu alu1(
    .A(alu_in1),
    .B(alu_in2),
    .sel(alu_sel),
    .Y(alu_result)
);
always @(posedge clk)
begin
    $display(
    "TIME=%0t A=%d B=%d FUNCT=%h ALUOP=%b SEL=%b RESULT=%d",
    $time,
    alu_in1,
    alu_in2,
    idex_funct,
    idex_alu_op,
    alu_sel,
    alu_result
    );
end
//=====================
// EX/MEM
//=====================

EX_MEM exmem(
    .clk(clk),
    .reset(reset),
    .alu_result_in(alu_result),
    .write_data_in(alu_in2),
    .rd_in(idex_rd),
    .reg_write_in(idex_reg_write),
    .mem_read_in(idex_mem_read),
    .mem_write_in(idex_mem_write),
    .alu_result_out(exmem_alu_result),
    .write_data_out(exmem_write_data),
    .rd_out(exmem_rd),
    .reg_write_out(exmem_reg_write),
    .mem_read_out(exmem_mem_read),
    .mem_write_out(exmem_mem_write)
);
//=====================
// MEM Stage
//=====================
wire [31:0] mem_data;
DataMemory dm(
    .clk(clk),
    .mem_read(exmem_mem_read),
    .mem_write(exmem_mem_write),
    .address(exmem_alu_result),
    .write_data(exmem_write_data),
    .read_data(mem_data)
);
//=====================
// MEM/WB
//=====================


MEM_WB memwb(
    .clk(clk),
    .reset(reset),

    .mem_data_in(mem_data),
    .alu_result_in(exmem_alu_result),

    .rd_in(exmem_rd),
    .reg_write_in(exmem_reg_write),

    .mem_read_in(exmem_mem_read),

    .mem_data_out(memwb_mem_data),
    .alu_result_out(memwb_alu_result),

    .rd_out(memwb_rd),
    .reg_write_out(memwb_reg_write),

    .mem_read_out(memwb_mem_read)
);
wire [31:0] cycle_count;
wire [31:0] instr_count;

PerformanceCounter perf(
    .clk(clk),
    .reset(reset),
    .instr_valid(memwb_reg_write),

    .cycle_count(cycle_count),
    .instr_count(instr_count)
);
endmodule