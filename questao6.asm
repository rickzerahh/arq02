
	lui $a1,0x2080
	addi $a1,$a1,0x00
	lui $a2,0x3208
	addi $a2,$a2,0xFF0
	
	
	#  (-1020 < a1 < -5 && 50 < a2 < 150 )

Proc:	
	
	addi $t1,$zero,-1020
	addi $t2,$zero,-5
	addi $t0,$zero,50
	addi $t4,$zero,150	
loop:	add $a1,$a1,$a1
	add $a2,$a2,$a2
	slt $t5,$a1,$t1
	bne $t5,$zero,Exit
	slt $t5,$a1,$t2
	beq $t5,$zero,Exit
	slt $t5,$a2,$t0
	bne $t5,$zero,Exit
	slt $t5,$a1,$t4
	beq $t5,$zero,Exit
	j loop	
Exit:	add $v0,$v0,$a1
	add $v0,$v0,$a2
	jr $ra
