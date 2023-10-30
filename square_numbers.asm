#
# data declarations
#
.data       	# marks the start of the data to be loaded into RAM at program start
c:    	.word 0 	#adress to save the awnser to
n: 		.word 20	# <20 in for
bytePerWord: 	.word 4
.align 2
v: 		.space 80

#
# code
#
.globl main    	# main is declared as a global marker, can be accessed from other files
.text          	# marks the start of the instructions, i.e. the program

main:
	###
	li 	$t0, 0	#init index
	lw  $s0, n 	#init maxI
	lw  $s1, bytePerWord #num of Bytes per Word
	li 	$t1, 0 	#init the sum
	
	
for:
	bge $t0, $s0, endfor 	#
	
	mul $t4, $t0, $t0 		#squares the index
	add $t1, $t1, $t4		#adds to Sum
	
	mul $t3, $t0, $s1 	#number of bytes to offset in array
	add $t3, $t3, $s2 	#current offset adress
	sw  $t4, v($t3)		#saves word in apropriate possition in array
	
	
	addi $t0, $t0, 1			#i++
	j for						

endfor:
	div $t1, $s0				#creates average of sum
	mflo $t1					
	