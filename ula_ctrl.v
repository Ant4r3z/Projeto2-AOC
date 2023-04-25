// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module ula_ctrl (
    ALUOp, func, Op
);

input wire [3:0] ALUOp;
input wire [5:0] func;

output reg [3:0] Op;

reg [3:0] _Op;

always @(*) begin
    case (func)
        6'b000000: _Op = 4'b0000; // sll
        6'b000010: _Op = 4'b0001; // srl
        6'b000011: _Op = 4'b0010; // sra
        6'b000100: _Op = 4'b0011; // sllv
        6'b000110: _Op = 4'b0100; // srlv
        6'b000111: _Op = 4'b0101; // srav
        6'b100000: _Op = 4'b0110; // add
        6'b100010: _Op = 4'b0111; // sub
        6'b100100: _Op = 4'b1000; // and
        6'b100101: _Op = 4'b1001; // or
        6'b100110: _Op = 4'b1010; // xor
        6'b100111: _Op = 4'b1011; // nor
        6'b101010: _Op = 4'b1100; // slt
        6'b101001: _Op = 4'b1101; // sltu
        default: _Op = 4'b0000;
    endcase
end

always @(*) begin
    case (ALUOp)
        4'b0000: Op = 4'b0110;   // add
        4'b0001: Op = 4'b0111;   // sub
        4'b0010: Op = 4'b1000;   // and
        4'b0011: Op = 4'b1001;   // or
        4'b0100: Op = 4'b1010;   // xor
        4'b0101: Op = 4'b1100;   // slt
        4'b0110: Op = 4'b1101;    // sltu
        4'b0111: Op = _Op;       // func
        4'b1000: Op = 4'b1110;   //lui
        4'b1001: Op = 4'b1111;   //ori
        default: Op = 4'b0000;
    endcase
end

    
endmodule