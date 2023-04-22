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

wire branch_eq, branch_ne;
wire memread, memwrite, memtoreg;
wire regdst, regwrite, alusrc;
wire jump;

wire [31:0] sign_extend_out

PC pc (clock, nextPC, pcout);

ula_ctrl ula_ctrl0 (ALUOp, instruction[5:0], OP);

ula ula0 (aluin1, aluin2, OP, aluresult, zero_flag);

control ctrl(instruction[31:26], branch_eq, branch_ne, ALUOp, memread, memwrite, memtoreg, regdst, regwrite, alusrc, jump);

sign_extend sign_extend (instruction[15:0], sign_extend_out);

endmodule