module dmem(address, writeData, memWrite, memRead, readData);

parameter memorySize = 256;

input wire [31:0] address;
input wire [31:0] writeData;
input wire memWrite;
input wire memRead;

output wire [31:0] readData;

reg [31:0] mainMem [memorySize-1:0];

integer i;
initial begin
    for (i = 0; i < memorySize; i = i + 1)
    begin
        mainMem[i] <= 32'b0;
    end
end

always @(*) begin
    if (memWrite) begin
        mainMem[address] <= writeData;
    end
end

assign readData = (memRead == 0) ? 32'b0 : mainMem[address];

endmodule