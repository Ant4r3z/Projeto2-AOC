module mips(
clock
);

wire [31:0] pcout, nextPC;
input wire clock;
wire [2:0] ALUOp;
wire [5:0] func;
wire [3:0] OP;
wire [31:0] aluin1, aluin2;
wire [31:0] aluresult;
wire zero_flag;
wire [4:0] shamt;

PC pc (clock, nextPC, pcout);
ula_ctrl ula_ctrl0 (ALUOp, func, OP);
ula ula0 (aluin1, aluin2, OP, aluresult, zero_flag);

endmodule