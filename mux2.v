module mux2 (A, B, sel, X);
	input wire [31:0] A, B;
	input wire sel;
	output reg [31:0] X;

always @(*) begin
	X = sel? B : A;	
end
endmodule