// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module e (in1, in2, andout);
input wire in1, in2;
output reg andout;

always @(*)begin
    andout = in1 & in2;
end
endmodule