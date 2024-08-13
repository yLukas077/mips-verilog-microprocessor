.data
	newline: .asciiz "\n"  # Define a string para uma nova linha
	newline1: .asciiz "\n"  # Define a string para uma nova linha
	newline2: .asciiz "\n"  # Define a string para uma nova linha
	newline3: .asciiz "\n"  # Define a string para uma nova linha
	newline4: .asciiz "\n"  # Define a string para uma nova linha
.text
	addi $t0, $zero, 21
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	sw   $t0, 0x10010000
	
	addi $t1, $zero, 2
	move $a0, $t1
	li $v0, 1
	syscall 
	
	la $a0, newline1
	li $v0, 4
	syscall
	
	la $a0, newline2
	li $v0, 4
	syscall
	sw   $t1, 0x10010020
	
	addi $t2, $zero, 5
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, newline3
	li $v0, 4
	syscall
	sw   $t2, 0x10010040
	
	add  $t3, $t0, $t1
	move $a0, $t3
	li $v0, 1
	syscall
	sw   $t3, 0x10010060
	
	la $a0, newline4
	li $v0, 4
	syscall
	
	sub  $t4, $t3, $t2
	move $a0, $t4
	li $v0, 1
	syscall
	sw   $t4, 0x10010080
