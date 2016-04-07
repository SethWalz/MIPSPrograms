## Write a MIPS program to input a sequence of integers, terminated my 0, and print-out the sum
## of all the numbers.
## Michael Walz
## Due monday, September 22

	.data 
x:	.word 2
z:	.space 3
prompt1:
	.asciiz  "Input integer: "
prompt2:
	.asciiz "The sum of all integers is: "
plus:	.asciiz " + "
equals:	.asciiz " = "
endl:	.asciiz " \n"

	.text 
	##input x

		
next:	
	lw $t4,x
	beqz $t4,end
	li $v0,4
	la $a0,prompt1
	syscall
	

	
	li $v0,5
	syscall
	la $a0,x
	sw $v0,0($a0)
	
	


	## Add x 
	la $t1, x
	lw $t2,0($t1)
	

	add $t5,$t5,$t2
	b next
	
	## Store result and print result
end:	
	la $t1,z
	sw $t5, 0($t1)
	
	li $v0,4
	la $a0,prompt2
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall

	li $v0,10
	syscall
	
	
