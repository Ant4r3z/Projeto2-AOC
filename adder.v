// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module adder ( input wire [31:0] valor1,  
                input wire [31:0] valor2,    
  
                  output reg [31:0] soma);

always @(*) begin
  soma = valor1 + valor2;  
end
endmodule