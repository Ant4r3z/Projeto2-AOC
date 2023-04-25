// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module shift_operator (
  l_Shift,
  shift_out
); 
 
  input wire [31:0] l_Shift;
  output reg [31:0] shift_out;

always @(*) begin
  shift_out = l_Shift << 2;
end
   
endmodule