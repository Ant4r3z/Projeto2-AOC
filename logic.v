module e (in1, in2, andout);
input wire in1, in2;
output reg andout;

always @(*)begin
    andout = in1 & in2;
end
endmodule