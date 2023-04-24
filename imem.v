module int_mem(address,i_out);

input [31:0] address;
output reg [31:0] i_out;
reg [31:0] instrucao [255:0];


integer i;



initial begin
        $readmemb("C:/quartus/Projeto2-AOC/teste_no5.list", instrucao);
    end

      
always @(address)
        begin
                i_out = instrucao[address>>2];
        end

endmodule
