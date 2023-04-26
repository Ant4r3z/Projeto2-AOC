module dmem(clock, writeData, address, memWrite, memRead, readData);

parameter memorySize = 256;

input wire [31:0] address;
input wire [31:0] writeData;
input wire memWrite;
input wire memRead;

output wire [31:0] readData;
input clock;
reg [31:0] mainMemory [0:memorySize-1];

integer i;
initial begin
    for (i = 0; i < memorySize; i = i + 1)
    begin
        mainMemory[i] <= 32'b0;
    end
end

always @(posedge clock) begin
    if (memWrite == 1'b1) begin
        mainMemory[address] <= writeData;
    end

    // if(memRead) begin
    //     readData <= mainMemory[address];
    // end else begin
    //     readData <= 32'b0;
    // end
end

assign readData = (memRead == 0) ? 32'b0 : mainMemory[address];

// always @(address) begin
//     if (memRead == 1'b1) begin
//         readData <= mainMemory[address];
//     end
// end

endmodule