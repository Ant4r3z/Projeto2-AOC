.eqv magic_number 1024000

.text 
	#magica_number: prefixo para o número do teste (OBS: devido ao tamanho do magic_number, vai esta instrucao vai virar 3 instruções: LUI, ORI e ADD)
	addi $t9, $0, magic_number
	
	# teste 1 - ADD, SUB e ADDI
	addi $t9, $t9, 1 #incremento do contador de teste. Deve aparecer na ULA o magic number + num do teste
	addi $s0, $0, 20
	addi $s1, $0, 15
	
	add $t0, $s0, $s1 #resultado da ULA deve ser 35
	sub $t1, $s0, $s1 #resultado da ULA deve ser 5
	addi $t2, $s0, 20 #resultado da ULA deve ser 40
	and $t3, $s0, $s1 #resultado da ULA deve ser 4
	or $t4, $s0, $s1 #resultado da ULA deve ser 31
	xor $t5, $s0, $s1 #resultado da ULA deve ser 27
	nor $t6, $s0, $s1 #resultado da ULA deve ser -32 (SIGNED)
	
	# teste 2 - SLL e BEQ: na primeira it. loop, deve retornar para o label. No 2o, deve seguir adiante
	addi $t9, $t9, 1 #incremento do contador de teste
	
	addi $s0, $0, 5
	addi $s1, $0, 20	
	teste2:	
	sll $s0, $s0, 2
	beq $s0, $s1, teste2 
	
	# teste 3 - SLLV e BNE: na primeira it. loop, deve retornar para o label. No 2o, deve seguir adiante
	addi $t9, $t9, 1 #incremento do contador de teste
	
	addi $s0, $0, 5
	addi $s1, $0, 80
	addi $t0, $0, 2	
	teste3:
	sllv $s0, $s0, $t0
	bne $s0, $s1, teste3
	
	#teste 4 - SRA e SLT: nas 2a primeiras it devem voltar, na 3a deve seguir adiante
	addi $t9, $t9, 1 #incremento do contador de teste
	
	addi $s0, $0, -2
	addi $s1, $0, -8
	
	teste4:
	sra $s1, $s1, 1
	slt $t0, $s0, $s1
	beq $t0, $0, teste4
	
	#teste 5 - LW e SW
	addi $t9, $t9, 1 #incremento do contador de teste
	
	addi $s6, $0, 12 #endereco base
	addi $s7, $0, 40 #edereco base
	
	addi $s0, $0, 10
	addi $s1, $0, 20
	addi $s2, $0, 30
	addi $s3, $0, 40
	
	sw $s0, 0($s6) #salva 10 no endereco 12
	sw $s1, 4($s6) #salva 20 no endereco 16
	sw $s2, 8($s7) #salva 30 no endereco 48
	sw $s3, 12($s7) #salva 40 no endereco 52 
	
	lw $t0, 12($0) #recupera 10 do endereco 12
	lw $t1, 16($0) #recupera 20 do endereco 16
	add $t3, $t0, $t1 #resultado da soma deve ser 30
	
	lw $t0, 48($0) #recupera 30 do endereco 48
	lw $t1, 52($0) #recupera 40 do endereco 52 
	add $t4, $t0, $t1 #resultado da soma deve ser 70
	add $t0, $t3, $t4 #resultado da soma deve ser 100
	
	
	#teste 6 - Jump
	addi $t9, $t9, 1 #incremento do contador de teste
	
	j jump
	#nada disso deve acontecer
	addi $8, $0, -1
	addi $8, $0, -2
	addi $8, $0, -3
	addi $8, $0, -4
	jump:
	addi $8, $0, 1 #isso deve acontecer
		
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
	
	
	
	