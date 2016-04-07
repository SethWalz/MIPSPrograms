	.text
	
## Input the size of array and store the size in $t0
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0
	
## Allocates block of memory size $t1 = 4xn
## Puts the adress of the block back in $s0
	add $t1,$t0,$t0
	add $t1,$t1,$t1
	
	li $v0, 9
	move $a0, $t1
	syscall
	move $s0, $v0
## Loop to input n floats and store them in address of $a0
## $t2 in the address of current float array
## $t3 is the number of floats left to input 
	move $t2, $s0
	move $t3, $t0
	
	l.s $f0, 0($t2)
	move $a0, $f0
	
loop:
	li $v0, 4 
	la $a0, prompt2
	syscall
	
	li $v0, 6
	syscall
	
	s.s $f0, 0($t2)
	addi $t2,$t2,4
	addi $t3, $t3, -1
	bnez $t3, loop
	
## Convert n to float
	mtc1 $t0,$f3
	cvt.s.w $f3,$f3
## move from memory to float register
	l.s $f4, 0($s0)
## Exit
	li $v0, 10
	syscall

mean:
	lw $f0 ,0($t2)
	add.s $f1, $f0,$f0
	addiu $t2, $t2, 4
	mul $t5,$t0, 4
	beq $t2, $t5, mean
	div.s $f2, $f0, $t0 
	
	
	
	
	

	.data 
	prompt:
		.asciiz "Enter positive integer n: "
	prompt2:
		.asciiz "Input float: "
	endl:
		.asciiz "\n"