module processor_top(
    input clk,
    input rst
);

wire [31:0] pc;
wire [31:0] instruction;
wire [31:0] pc_next;

wire reg_write;
wire mem_read;
wire mem_write;
wire branch;
wire alu_src;
wire mem_to_reg;

wire [1:0] alu_op;

wire [31:0] rs1_data;
wire [31:0] rs2_data;
wire [31:0] imm_data;
wire [31:0] alu_in2;
wire [31:0] alu_result;
wire [31:0] mem_data;

wire zero;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd  = instruction[11:7];

pc PC(
    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc(pc)
);

instruction_memory IM(
    .addr(pc),
    .instruction(instruction)
);

control_unit CU(
    .opcode(instruction[6:0]),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .branch(branch),
    .alu_src(alu_src),
    .mem_to_reg(mem_to_reg),
    .alu_op(alu_op)
);

register_file RF(
    .clk(clk),
    .reg_write(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(mem_to_reg ? mem_data : alu_result),
    .read_data1(rs1_data),
    .read_data2(rs2_data)
);

immediate_generator IG(
    .instruction(instruction),
    .imm_out(imm_data)
);

assign alu_in2 = alu_src ? imm_data : rs2_data;

alu ALU(
    .a(rs1_data),
    .b(alu_in2),
    .alu_op(alu_op),
    .funct3(instruction[14:12]),
    .funct7(instruction[31:25]),
    .result(alu_result),
    .zero(zero)
);

data_memory DM(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .addr(alu_result),
    .write_data(rs2_data),
    .read_data(mem_data)
);

branch_unit BU(
    .pc(pc),
    .branch(branch),
    .zero(zero),
    .imm(imm_data),
    .pc_next(pc_next)
);

endmodule