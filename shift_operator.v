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