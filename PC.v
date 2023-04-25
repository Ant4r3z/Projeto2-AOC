// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues


// módulo de PC, atualiza a instrução que será enviada ba memória
module PC (clock, nextPC, PC);

	input clock;
	input [31:0] nextPC;
	output reg [31:0] PC;


	always @(posedge clock) 
	begin
		PC <= nextPC;
	end
endmodule