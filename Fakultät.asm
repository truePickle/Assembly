#
#data
#

.data
	
	a: .word 25
	
	
#
# code
#

.globl main
.text

main:
 
	lw $a0, a

	#fact call
	jal fact
	move $a0, $s0
	#print
	li, $v0, 1
	syscall
	#exit
	li $v0, 10
	syscall
	
	
fact:
	move $t0, $a0
	li $s0, 1
	
	
forfact:
	beq $t0, $0, exitfact
	mul $s0, $s0, $t0
	subi $t0, $t0, 1
	j forfact
	
exitfact:
	jr $ra
	