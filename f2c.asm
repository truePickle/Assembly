#
#data
#

.data
const5:		.float 5.0
const9:		.float 9.0
const32:	.float 32.0
abs0: 		.float -273.15

input: 		.float -459.66

#
#code
#
.globl main
.text

main:
	#load input and call function
	lwc1 $f12, input
	jal f2c
	
	#print output
	mov.s $f12, $f0
	li $v0, 2
	syscall
	
	#exit
	li $v0, 10
	syscall
	
	
f2c: 
	lwc1 $f18, const5
	lwc1 $f20, const9
	div.s $f22, $f18, $f20		#$f22 = 5/9
	lwc1 $f24, const32
	sub.s $f0, $f12, $f24		#$f0 = fahr - 32
	mul.s $f0, $f22, $f0		#$f0 = 5/9 *(fahr - 32)
	#check absolute zero
	lwc1 $f26, abs0
	c.lt.s $f0, $f26			#$f0 < $f26
	bc1t changeToAbs0			#change $f0 to abs0
	
	jr $ra

changeToAbs0:
	lwc1 $f0, abs0
	jr $ra
	
	