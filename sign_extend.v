// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

module sign_extend (
    in, out
);

input wire [15:0] in;
output reg [31:0] out;

always @(*) begin
    out <= {{16{in[15]}}, in};
end

endmodule