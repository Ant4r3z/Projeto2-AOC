# teste 2 - SLL e BEQ: na primeira it. loop, deve retornar para o label. No 2o, deve seguir adiante
	addi $t9, $t9, 1 #incremento do contador de teste
	
	addi $s0, $0, 5
	addi $s1, $0, 20	
	teste2:	
	sll $s0, $s0, 2
	beq $s0, $s1, teste2 