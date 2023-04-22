module shift_operator (
  l_Shift,
  shift_out
); 
 
  input wire [31:0] l_Shift;
  output wire [31:0] shift_out;

  assign shift_out = l_Shift << 2;
   
endmodule