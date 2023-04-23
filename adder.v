module adder ( input wire [31:0] valor1,  
                input wire [31:0] valor2,    
  
                  output reg [31:0] soma);

always @(*) begin
  soma = valor1 + valor2;  
end
endmodule