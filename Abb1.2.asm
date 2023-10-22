#
#data
#
.data
	.align 2
	a: .word 5, 2, 1, 1, 2, 2, 4, 3, 9, 1


#
#code
#
.globl main
.text

main:
	li $t0, 0 	#tmp
	li $t1, 0 	#i
	j while

	
	
while:
	#conditions
	bgt $t0, 5, output
	bge $t1, 9, output
	
	add $t1, $t1, 1	#iterate i by 1	
	
	#load i, i+1 int $t4. $t5
	lw $t4, a($t1)
	addi $t3, $t1, 1
	lw $t5, a($t3)
	add $t0, $t4, $t5
	div $t0, $t0, 2
	
	j while		#jump back to top
	


output:
	#output
	move  $a0, $t0
	li $v0, 1
	syscall