module adder ( input wire [31:0] valor1,  
                input wire [31:0] valor2,    
  
                  output wire [31:0] soma);

  assign {soma} = valor1 + valor2;  
endmodule