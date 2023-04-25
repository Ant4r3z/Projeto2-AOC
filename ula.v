module ula (
    In1, In2, OP, result, Zero_flag, shamt, immediate, bne
);

input wire [31:0] In1, In2;
input wire [3:0] OP;
input wire [4:0] shamt;
output reg [31:0] result;
output wire Zero_flag;

input wire [15:0] immediate;
input wire bne;

assign Zero_flag = bne ? (result != 0) : (result == 0);


always @(*) begin
    case (OP)
        4'b0000: result <= In2 << shamt;    // sll
        6'b0001: result <= In2 >> shamt;    // srl
        6'b0010: result <= $signed ($signed (In2) >>> shamt);    // sra
        6'b0011: result <= $unsigned($unsigned(In2) << $unsigned(In1));      // sllv
        6'b0100: result <= $unsigned($unsigned(In2) >> $unsigned(In1));      // srlv
        6'b0101: result <= $signed($signed(In2) >> $signed(In1));      // srav
        6'b0110: result <= In1 + In2;       // add
        6'b0111: result <= In1 - In2;       // sub
        6'b1000: result <= In1 & In2;       // and
        6'b1001: result <= In1 | In2;       // or
        6'b1010: result <= In1 ^ In2;       // xor
        6'b1011: result <= $signed(~($signed(In1) | $signed(In2)));    // nor
        6'b1100: result <= $signed($signed(In1) < $signed(In2));       // slt
        6'b1101: result <= $unsigned($unsigned(In1) < $unsigned(In2));       // sltu
        6'b1110: result <= {immediate, 16'b0};     // lui
        6'b1111: result <= In1 | {16'b0, immediate};     // ori
        default: result <= 0;
    endcase
end


endmodule