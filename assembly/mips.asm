.data
	altura: .word 170
	peso: .word 50
.text
	lw $s1, altura
	lw $s2, peso
	jal calcular_imc
	blt $t5, 19 retorno1
	bge $t5, 19, retorno2
	
calcular_imc:
	addi $t7, $t6, 10000
	mul $a1, $s2, $t7
	mul $t1, $s1, $s1
	div $t0, $a1, $t1
	mflo $t5
	jr $ra
retorno1:
	addi $a0, $t6, 1
	j saida
retorno2:
	bgt $t5, 25, retorno3
	addi $a0, $t6, 2
	j saida
retorno3:
	addi $a0, $t6, 3
	j saida
saida:
	
