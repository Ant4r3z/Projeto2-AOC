// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module mips(
clock, pcout, nextPC, aluresult, instruction, readdata
);

output wire [31:0] pcout;
output wire [31:0] nextPC;
wire [31:0] mux_branch_out;
input wire clock;
wire [3:0] ALUOp;
wire [3:0] OP;
wire [31:0] aluin1, aluin2;
output wire [31:0] aluresult;
wire zero_flag;
wire [4:0] shamt;
output wire [31:0] instruction;
wire [4:0] ReadAddr1;
wire [4:0] ReadAddr2;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [4:0] WriteAddr;
wire [31:0] WriteData;
wire Reset;
wire memread, memtoreg, regdst, regwrite, alusrc, branch, bne;
wire memwrite;
wire jump;

wire address;



wire [31:0] sign_extend_out;

wire [31:0] shift_branch_out;

wire [31:0] add_pc_4_out, add_pc_4_jal_out;

wire [31:0] adder_branch_out;



wire and_branch_out;

output wire [31:0] readdata; 

wire [31:0] jump_address, mux_jump_out, instructionWriteAddress;

wire [31:0] mux_data_out;

// modulos e conexoes

PC pc (clock, nextPC, pcout);

ula_ctrl ula_ctrl0 (ALUOp, instruction[5:0], OP);

ula ula0 (aluin1, aluin2, OP, aluresult, zero_flag, instruction[10:6], instruction[15:0], bne);

control ctrl(instruction[31:26], instruction[5:0], branch, bne, ALUOp, memread, memwrite, memtoreg, regdst, regwrite, alusrc, jump);

sign_extend sign_extend (instruction[15:0], sign_extend_out);

Regfile regfile (instruction[25:21], instruction[20:16], aluin1, ReadData2, clock, WriteData, regwrite, Reset, WriteAddr);

mux2 muxWriteRegister (instruction[20:16],instruction[15:11], regdst, instructionWriteAddress);
mux2 muxJumpWR (instructionWriteAddress, 5'b11111, jump, WriteAddr);

mux2 muxAlu (ReadData2, sign_extend_out, alusrc, aluin2);

shift_operator shift_branch (sign_extend_out, shift_branch_out);

adder adder_branch (mux_jump_out, shift_branch_out, adder_branch_out);

adder adder_pc (pcout, 32'b100, add_pc_4_out);

e and_branch (branch, zero_flag, and_branch_out);

mux2 mux_branch (mux_jump_out, adder_branch_out, and_branch_out, mux_branch_out);

mux2 mux_data (aluresult, readdata, memtoreg, mux_data_out);

int_mem imem (pcout, instruction);

jump_control jpctrl (instruction, add_pc_4_out, jump_address);

mux2 muxJumpControl (add_pc_4_out, jump_address, jump, mux_jump_out);

dmem d_mem (clock, ReadData2, aluresult, memwrite, memread, readdata);

adder adder_pc_jal (add_pc_4_out, 32'b100, add_pc_4_jal_out);
mux2 mux_write_data (mux_data_out, add_pc_4_jal_out, jump, WriteData);

endmodule