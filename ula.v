module ula (
    In1, In2, OP, result, Zero_flag
);

input wire [31:0] In1, In2;
input wire [3:0] OP;
input wire [4:0] shamt;
output reg [31:0] result;
output wire Zero_flag

assign Zero_flag = (result == 0)


always @(*) begin
    case (OP)
        4'b0000: result <= In1 << shamt;    // slt
        6'b0001: result <= In1 >> shamt;    // srl
        6'b0010: result <= In1 >> shamt;    // sra
        6'b0011: result <= In1 << In2;      // sllv
        6'b0100: result <= In1 >> In2;      // srlv
        6'b0101: result <= In1 >> In2;      // srav
        6'b0110: result <= In1 + In2;       // add
        6'b0111: result <= In1 - In2;       // sub
        6'b1000: result <= In1 & In2;       // and
        6'b1001: result <= In1 | In2;       // or
        6'b1010: result <= In1 ^ In2;       // xor
        6'b1011: result <= !(In1 | In2);    // nor
        6'b1100: result <= In1 < In2;       // slt
        6'b1101: result <= In1 < In2;       // sltu
        default: result <= 0;
    endcase
end


endmodule