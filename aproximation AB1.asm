#
#data
#
.data


#
#code
#
.globl main
.text

main:
	#gets console input
	li $v0, 5
	syscall
	#sub 1- x/1!
	li  $t1, 1
	sub $t1, $t1, $a0
	#add $t1 x^2/2!
	mul $t2, $a0, $a0
	div $t3, $t2, 2
	add $t1, $t1, $t3
	#create x^3 in t2
	mul $t2, $a0, $a0
	mul $t2, $t2, $a0
	#divide by 3!
	div $t3, $t2, 6
	sub $t1, $t1, $t3
	#output 
	li $v0, 1
	move $a0, $t1
	syscall