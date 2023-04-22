module ula_ctrl (
    ALUOp, func, Op
);

input wire [2:0] ALUOp;
input wire [5:0] func;

output reg [3:0] Op;

reg [3:0] _Op;

always @(*) begin
    case (func)
        6'b000000: _Op = 4'b0000; // sll
        6'b000010: _Op = 4'b0001; // srl
        6'b000011: _Op = 4'b0011; // sra
        6'b000100: _Op = 4'b0010; // sllv
        6'b000110: _Op = 4'b0011; // srlv
        6'b000111: _Op = 4'b0100; // srav
        6'b100000: _Op = 4'b0101; // add
        6'b100010: _Op = 4'b0110; // sub
        6'b100100: _Op = 4'b0111; // and
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
        3'b000: Op = 4'b0101;   // add
        3'b001: Op = 4'b0110;   // sub
        3'b010: Op = 4'b0111;   // and
        3'b011: Op = 4'b1001;   // or
        3'b100: Op = 4'b1010;   // xor
        3'b101: Op = 4'b1100;   // slt
        3'b110: Op = 4'b1101;    // sltu
        3'b111: Op = _Op;       // func
        default: Op = 4'b0000;
    endcase
end

    
endmodule