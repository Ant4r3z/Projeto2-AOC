// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module mux2 (A, B, sel, X);
	input wire [31:0] A, B;
	input wire sel;
	output reg [31:0] X;

always @(*) begin
	X = sel? B : A;	
end
endmodule