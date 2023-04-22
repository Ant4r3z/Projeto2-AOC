module shift_operator (); 
 
  reg        [3:0] r_Shift1 = 4'b1000;
  reg signed [3:0] r_Shift2 = 4'b1000;
   
  initial
    begin
      // Shift left 
      $display("%b", r_Shift1 <<  1);
      $display("%b", $signed(r_Shift1) <<< 1); // Cast as signed
      $display("%b", r_Shift2 <<< 1); // Declared as signed type // Right Shift $display("%b", r_Shift1 >>  2);
      $display("%b", $signed(r_Shift1) >>> 2); // Cast as signed
      $display("%b", r_Shift2 >>> 2) ;         // Declared as signed type
    end
endmodule