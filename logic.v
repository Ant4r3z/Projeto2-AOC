module e (in1, in2, andout);
input wire in1, in2;
output wire andout;
    assign andout = in1 & in2;
endmodule