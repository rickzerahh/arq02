
 #A =$A0,  B = $A1,  X = $A2  e Y  = $A3,
 
 Mult:
 	add $t0,$zero,$zero # contador
loop:	slt $t1,$t0,$a1
 	beq $t1,$zero,Exit
 	addi $t0,$t0,1
 	add $v0,$v0,$a0
 	j loop
 Exit:  jr $ra
 
 Div:
	add $t0,$zero,$zero
  loop2: slt $t1,$t0,$a3
  	beq $t1,$zero,Exit
  	addi $v0,$t0,1
  	sub $a2,$a2,$a2
  	j loop2  
  Exit: jr $ra
  
  
  Pot:
  	add $t0,$zero,$zero   # contador potenciacao
  	add $t2,$zero,$zero # contador multiplicacao
loopPot:slt $t1,$t0,$a1
	addi $t0,$t0,1
	beq $t1,$zero,exit  	
loop:	slt $t1,$t2,$a1
 	beq $t1,$zero,loopPot
 	addi $t2,$t2,1
 	add $v0,$v0,$a0
 	j loop 	 	
 Exit:  jr $ra
 
 
 
 	addi $sp,$sp,-12
 	sw $a0,0($sp)
 	sw $a3,4($sp)
 	sw $ra,8($sp)
 	add $a0,$zero,$a1
 	add $a1,$zero,$a3
 	jal Mult
 	lw $a0,0($sp)
 	lw $a3,4($sp)
 	lw $ra,8($sp)
 	addi $sp,$sp,12 	
 	add $a3,$zero,$v0
 	add $a2,$zero,$a0
 	jal Div
 	add $a0,$zero,$v0
 	add $a1,$zero,$a2
 	jal Pot
 	jr $ra
 	
 