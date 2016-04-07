###################################################
### Michael Walz
### 700609721
### msw97210
###################################################
### Main Program
### $a0 = 9
### $v0 = F(9)
###################################################
.text	
	la $a0,prompt
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $a0,$v0
	jal fib
	move $a0,$v0
	li $v0,1
	syscall
	la $a0,endl
	li $v0,4
	syscall
	li $v0,10
	syscall
####################################################
### Fibonacci Subroutine
### Recursive implementation of the Fibonacci function
### Values to put on stack
### n = $a0
### intermediate value fib(n-1)
### $ra
####################################################
####################################################
### F(0) = 0 and F(1) = 1
####################################################
fib: 
	bgt $a0,2,gt1
	li $t1, 0
	li $t2, 1
	li $t3, 2
	beq $a0,$t1, else
	beq $a0,$t2, else2
	beq $a0,$t3, else3
else:	li $v0, 3
	j endif
else2:	li $v0, 0
	j endif
else3: li $v0, 2
	j endif
endif:
	jr $ra
gt1: 
	sub $sp,$sp,12
	sw $a0,0($sp)
	sw $ra,8($sp)
	sub $a0,$a0,2
####################################################
### Compute F(n-1)
####################################################
	jal fib
	move $s0,$v0
	lw $a0,0($sp)
	lw $ra,8($sp)
	add $sp,$sp,12
	sub $sp,$sp,12
	sw $a0,0($sp)
	sw $s0,4($sp)
	sw $ra,8($sp)
	sub $a0,$a0,3
###################################################
### Compute F(n-2)
###################################################
	jal fib
	lw $s0,4($sp)
	lw $ra,8($sp)
	add $v0,$v0,$s0
	add $sp,$sp,12
	jr $ra
.data
prompt: .asciiz "Input integer: "
endl:.ascii "\n"