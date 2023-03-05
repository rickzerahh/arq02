

# vetor de 10 numero $a0 

start:
	addi $t0,$zero,1 # contador de interacoesw
	add $s0,$zero,$zero # inicia o s0 para gravar leituras dos espacos de memoria
	
loop:	lw $s1,0,($a0)# salva o espaco de memoria s0
	
   	slti $t1,$t0,10 # t0 >= 10
	beq $t1,$zero,divisao # se sim sai 
	add $s3,$s3,$s1 # s3 soma para aritmetica
	
	addi $s0,$s0,4
	j loop
divisao: add $t3,$zero,$zero
	slti $t4,$t3,10 # valor da soma s3, e valor de t3 - 10
	beq $s4,$zero,Exit
	addi $t3,$t3,1 # valor da divisao
	subi $s3,$s3,10 # resto da divisao
Exit:	jr $ra