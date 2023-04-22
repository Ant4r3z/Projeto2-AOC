module Regfile (ReadAddr1, ReadAddr2,ReadData1, ReadData2, Clock, WriteData, RegWrite, Reset, WriteAddr);

input [4:0] ReadAddr1;
input [4:0] ReadAddr2;
output reg [31:0] ReadData1;
output reg [31:0] ReadData2;
input Clock;
input [4:0] WriteAddr;
input [31:0] WriteData;
input RegWrite;
input Reset;

reg [31:0] arrayreg [31:0];
	integer r = 0;
	
initial 
	 begin
        arrayreg[0] = 0;
    end

    always @(ReadAddr1 or Clock) begin 
	 ReadData1 = arrayreg[ReadAddr1];
    end

    always @(ReadAddr2 or Clock) begin 
	 ReadData2 = arrayreg[ReadAddr2];
    end
	 
    always @(posedge Clock or posedge Reset) 
	 begin
			if (Reset) 
			begin
			for(r=0;r<32;r=r+1) 
		  begin
            arrayreg[r] <= 32'B0;
        end
		  end
        if (RegWrite && WriteAddr) 
		  begin
            arrayreg[WriteAddr] <= WriteData;
        end
		 
    end

endmodule