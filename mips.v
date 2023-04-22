module mips(
clock
);

wire [31:0] pcout, nextPC;
input wire clock;
wire [2:0] ALUOp;
wire [3:0] OP;
wire [31:0] aluin1, aluin2;
wire [31:0] aluresult;
wire zero_flag;
wire [4:0] shamt;
wire [31:0] instruction;
wire [4:0] ReadAddr1;
wire [4:0] ReadAddr2;
wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [4:0] WriteAddr;
wire [31:0] WriteData;
wire Reset;
wire branch_eq, branch_ne;
wire memread, memwrite, memtoreg;
wire regdst, regwrite, alusrc;
wire jump, branch;

wire address;



wire [31:0] sign_extend_out;

wire [31:0] shift_branch_out;

wire [31:0] add_pc_4_out;

wire [31:0] adder_branch_out;

wire mux_branch_out;


wire and_branch_out;

wire [31:0]readdata; 


PC pc (clock, nextPC, pcout);

ula_ctrl ula_ctrl0 (ALUOp, instruction[5:0], OP);

ula ula0 (aluin1, aluin2, OP, aluresult, zero_flag, instruction[11:7]);

control ctrl(instruction[31:26], branch_eq, branch_ne, ALUOp, memread, memwrite, memtoreg, regdst, regwrite, alusrc, jump);

sign_extend sign_extend (instruction[15:0], sign_extend_out);

Regfile regfile (instruction[25:21], instruction[20:16], ReadData1, ReadData2, clock, WriteData, regwrite, Reset, WriteAddr);

mux2 muxWriteRegister (instruction[20:16],instruction[15:11], regdst, WriteAddr);

mux2 muxAlu (ReadData2, sign_extend_out, alusrc, aluin2);

shift_operator shift_branch (sign_extend_out, shift_branch_out);

adder adder_branch (add_pc_4_out, shift_branch_out, adder_branch_out);

adder adder_pc (pcout, 32'b100, add_pc_4_out);

e and_branch (branch_eq, zero_flag, and_branch_out);

mux2 mux_branch (add_pc_4_out, adder_branch_out, and_branch_out, nextPC);

mux2 mux_data (aluresult, readdata, memtoreg, WriteData);

endmodule