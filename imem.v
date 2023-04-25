module int_mem(address,i_out);

input [31:0] address;
output reg [31:0] i_out;
reg [31:0] instruction [255:0];

initial begin
    $readmemb("C:/quartus/Projeto2-AOC/teste5.list", instruction);
end

always @(address) begin
    i_out = instruction[address>>2];
end

endmodule
