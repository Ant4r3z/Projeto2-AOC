	#teste 7 - JAL
	addi $t9, $t9, 1 #incremento do contador de teste
	
	jal jump_link #OBSERVAR O VALOR DO PC NESTA INSTRUÇÃO
	#nada disso deve acontecer
	addi $8, $0, -1
	addi $8, $0, -2
	addi $8, $0, -3
	addi $8, $0, -4
	jump_link:
	add $8, $0, $ra #deve apresentar na ULA o PC+4 da instrução jal JAL
	