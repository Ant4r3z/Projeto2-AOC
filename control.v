`ifndef _control
`define _control

module control(
			input wire [5:0] opcode,
			output reg branch,
			output reg [2:0] aluop,
			output reg memread, memwrite, memtoreg,
		    output reg regdst, regwrite, alusrc,
			output reg jump);
			
	always @(*) begin
		/* defaults */
		aluop[2:0] <= 2'b111;
		alusrc 	   <= 1'b0;
		
		memread    <= 1'b0;
		memtoreg   <= 1'b0;
		memwrite   <= 1'b0;
		regdst     <= 1'b1;
		regwrite   <= 1'b1;
		jump 	   <= 1'b0;
		
		case(opcode)
			6'b100011: begin 	/* lw */
				memread   <= 1'b1;
				regdst    <= 1'b0;
				memtoreg  <= 1'b1;
				aluop[1]  <= 1'b0;
				alusrc    <= 1'b1;
				branch <= 1'b0;
			end
			6'b001000: begin 	/* addi */
				regdst	  <= 1'b0;
				aluop  <= 3'b000;
				alusrc	  <= 1'b1;
				branch <= 1'b0;
			end
			6'b000100: begin 	/* beq */
				aluop  <= 4'b0001;
				branch <= 1'b1;
				regwrite  <= 1'b0;
				alusrc <= 1'b0;
			end
			6'b101011: begin 	/* sw */
				regdst 	  <= 1'bX;
				memread   <= 1'b0;
				memtoreg  <= 1'bX;
				memwrite  <= 1'b1;
				aluop[1]  <= 1'b0;
				alusrc	  <= 1'b1;
				regwrite  <= 1'b0;
				branch <= 1'b0;
			end
			6'b000101: begin 	/* bne */
				aluop  <= 4'b0001;
				branch <= 1'b1;
				regwrite  <= 1'b0;
				alusrc <= 1'b0;
			end
			6'b000000: begin	/* add */
				regdst    <= 1'b1;
				regwrite  <= 1'b1;
				alusrc 	  <= 1'b0;
				aluop  <= 3'b111;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				jump 	  <= 1'b0;
				branch <= 1'b0;
			end
			6'b000010: begin 	/* j */
				regdst    <= 1'bX;
				regwrite  <= 1'b0;
				alusrc    <= 1'bX;
				aluop     <= 4'bXXX;
				memwrite  <= 1'b0;
				memread	  <= 1'b0;
				memtoreg  <= 1'bX;
				branch <= 1'b0;
				
	
				jump      <= 1'b1;
			end
			6'b101010: begin     /* slt */
				regdst    <= 1'b1;
				regwrite  <= 1'b1;
				alusrc    <= 1'b0;
				aluop     <= 4'b101;
				memwrite  <= 1'b0;
				memread   <= 1'b1;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b101001: begin      /* sltu */
				regdst	  <= 1'b0;
				regwrite  <= 1'b1;
				alusrc	  <= 1'b0;
				aluop     <= 4'b101;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b100110: begin      /* xor */
				regdst    <= 1'b0;
				regwrite  <= 1'b1;
				alusrc    <= 1'b1;
				aluop     <= 4'b100;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b100101: begin      /* or */
				regdst    <= 1'b0;
				regwrite  <= 1'b1;
				alusrc    <= 1'b1;
				aluop     <= 4'b011;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b100100: begin      /* and */
				regdst    <= 1'b0;
				regwrite  <= 1'b1;
				alusrc    <= 1'b1;
				aluop     <= 4'b010;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b100010: begin     /* sub */
				regdst    <= 1'b1;
				regwrite  <= 1'b1;
				alusrc    <= 1'b0;
				aluop     <= 4'b110;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b001111: begin
				regdst    <= 1'b0;
				regwrite  <= 1'b1;
				alusrc    <= 1'b1;
				aluop     <= 4'b1000;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			6'b001101: begin      /* ori */
				regdst    <= 1'b0;
				regwrite  <= 1'b1;
				alusrc    <= 1'b1;
				aluop     <= 4'b1001;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
			default: begin
				regdst    <= 1'b1;
				regwrite  <= 1'b1;
				alusrc    <= 1'b0;
				aluop     <= 4'b0111;
				memwrite  <= 1'b0;
				memread   <= 1'b0;
				memtoreg  <= 1'b0;
				branch <= 1'b0;
				
	
				jump      <= 1'b0;
			end
		endcase
	end
endmodule

`endif
		
			
		
				
			
              
