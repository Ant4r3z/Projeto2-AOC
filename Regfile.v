
// [BCC 2022.1] Arquitetura e Organização de Computadores
// Atividade 2VA
// Arquitetantes:
// - Gabriel Santos
// - Gilvaney Leandro
// - Joyce Mirelle
// - Ronaldo Rodrigues

// nome do grupo, atividade 2VA, disciplina, semestre letivo, questão referente ao arquivo, breve descrição do conteúdo do arquivo, etc.
// Regfile: Banco de registradores, o qual recebe informações de um dois registradores e em seguida
// escreve em um registrador de forma assíncrona

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

// seta o tamanho dos registradores
reg [31:0] arrayreg [31:0];
	integer r = 0;
	
//seta o arrayreg para zero inicialmente
initial 
	 begin
        arrayreg[0] = 0;
    end

//integra o primeiro registrador lido com bae no clock no registrador destino
    always @(ReadAddr1 or Clock) begin 
	 ReadData1 = arrayreg[ReadAddr1];
    end

//integra o segundo registrador lido com bae no clock no registrador destino
    always @(ReadAddr2 or Clock) begin 
	 ReadData2 = arrayreg[ReadAddr2];
    end

//utilizando de posedge, Clock e Reset, a função é resetada quando os registradores são percorridos. 
    always @(posedge Clock or posedge Reset) 
	 begin
		if (Reset) begin
			for(r=0;r<32;r=r+1) begin
            arrayreg[r] <= 32'B0;
            end
        end else begin
        if (RegWrite) begin
            arrayreg[WriteAddr] <= WriteData;
            arrayreg[0] <= 0;
            end
        end
    end

endmodule