module mips(
clock, pcout, instruction, nextPC, ALUOp, OP, zero_flag, jump, jump_address, mux_jump_out, instructionWriteAddress
);

output wire [31:0] pcout, nextPC;
input wire clock;
output wire [2:0] ALUOp;
output wire [3:0] OP;
wire [31:0] aluin1, aluin2;
wire [31:0] aluresult;
output wire zero_flag;
wire [4:0] shamt;
output wire [31:0] instruction;
wire [4:0] ReadAddr1;
wire [4:0] ReadAddr2;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [4:0] WriteAddr;
wire [31:0] WriteData;
wire Reset;
wire memread, memwrite, memtoreg, regdst, regwrite, alusrc, branch, bne;
output wire jump;

wire address;



wire [31:0] sign_extend_out;

wire [31:0] shift_branch_out;

wire [31:0] add_pc_4_out;

wire [31:0] adder_branch_out;

wire mux_branch_out;


wire and_branch_out;

wire [31:0]readdata; 

output wire [31:0] jump_address, mux_jump_out, instructionWriteAddress;


PC pc (clock, nextPC, pcout);

ula_ctrl ula_ctrl0 (ALUOp, instruction[5:0], OP);

ula ula0 (aluin1, aluin2, OP, aluresult, zero_flag, instruction[10:6], instruction[15:0], bne);

control ctrl(instruction[31:26], branch, bne, ALUOp, memread, memwrite, memtoreg, regdst, regwrite, alusrc, jump);

sign_extend sign_extend (instruction[15:0], sign_extend_out);

Regfile regfile (instruction[25:21], instruction[20:16], aluin1, ReadData2, clock, WriteData, regwrite, Reset, WriteAddr);

mux2 muxWriteRegister (instruction[20:16],instruction[15:11], regdst, instructionWriteAddress);
mux2 muxJumpWR (instructionWriteAddress, 5'b11111, jump, WriteAddr);

mux2 muxAlu (ReadData2, sign_extend_out, alusrc, aluin2);

shift_operator shift_branch (sign_extend_out, shift_branch_out);

adder adder_branch (mux_jump_out, shift_branch_out, adder_branch_out);

adder adder_pc (pcout, 32'b100, add_pc_4_out);

e and_branch (branch, zero_flag, and_branch_out);

mux2 mux_branch (mux_jump_out, adder_branch_out, and_branch_out, nextPC);

mux2 mux_data (aluresult, readdata, memtoreg, WriteData);

int_mem imem (pcout, instruction);

jump_control jpctrl (instruction, add_pc_4_out, jump_address);

mux2 muxJumpControl (add_pc_4_out, jump_address, jump, mux_jump_out);

endmodule