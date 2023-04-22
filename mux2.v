module mux2 (A, B, sel, X);
	input wire A,B,sel;
	output wire X;
	
	assign X = sel? B : A;	
endmodule