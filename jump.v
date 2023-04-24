module jump_control (instruction, pc, jump_address);
input wire [31:0] pc, instruction;
output reg [31:0] jump_address;

always @(*) begin
    jump_address <= {pc[31:28], instruction[25:0], 2'b00};
end

endmodule