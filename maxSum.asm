## Michael Walz
## msw97210
## 700609721
.text
### $t0 - Number of Numbers
### $t1 - Current address in X
### $t2 - Integer input
li $t0,0
la $t1,X
loop: 
	la $a0,prompt
	li $v0,4
	syscall
### Input Integer
	li $v0,5
	syscall
	move $t2,$v0
### Check for 0 Input
### If 0, prepare to call subroutine 
### If not 0, store integer in X and continue
	beqz $t2,next
	sw $t2,0($t1)
	addi $t0,$t0,1
	addi $t1,$t1,4
	b loop
### Call subroutine sum
### Pass address of X in $a0 and number of elements in X in $a1
### Upon return, $v0 contains the sum
next: 
	la $a0,X
	move $a1,$t0
	jal sum
	move $t1,$v0 ### Output Message and Sum
	la $a0,prompt2
	li $v0,4
	syscall
	move $a0,$t1
	li $v0,1	
	syscall
	la $a0,endl
	li $v0,4
	syscall
### Exit
	li $v0,10
	syscall
### $t0 - Running total of integers
### $t1 - Current address in X
### $t2 - Number of integers left to add
### $t3 - Current integer
sum:
	li $t0,0
	move $t1,$a0
	move $t2,$a1
	
	
loop2: 
	beqz $t2,end
	lw $t3,0($t1)
	blt $t0,$t3,else
	subi $t2,$t2,1
	addi $t1,$t1,4
	j loop2
else:	
	addi $t0,$t3,0
	subi $t2,$t2,1
	addi $t1,$t1,4
	
	j loop2
end: 
	move $v0,$t0
	jr $ra
.data
X: .space 400
prompt:
.asciiz "Input integer, terminated by 0: "
prompt2:
.asciiz "The largest of the integers is "
endl: .asciiz "\n"
