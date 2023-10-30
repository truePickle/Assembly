#
#data
#
.data
	.align 2
	a: .word 
	
#
#code
#
.globl main
.text

main:

	jal max
	
	li $v0, 10
	syscall
	
max: 

	li $t0, 1 		#i
	move $t1, $a1 	#length
	move $t2, $a0 	#start of array
	lw $t3, $t2(0)	#temp
	
for:
	bge	$t0, $t1, return
	
if:
	mul $t5, $t0, 4	#get offset for array
	lw	$t4, $t2($t5) # get i place in array
	ble $t4, $t3, for 	
	move $t3, $t4	#temp = a[i]
	j for
	
return:
	move $a0, $t3
	j $ra
	