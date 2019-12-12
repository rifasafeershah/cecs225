#Use the MARS simulator to write and execute MIPS assembly code that will perform
#the high level language pseudocode.
#Use this file as a base and perform each exercise in order according to the 
#descriptions given in each comment.
#No pseudoinstrucions are allowed, use only the following basic MIPS instructions:
#	add	-	arithmetic add
#	sub	-	arithmetic subtract
#	and	-	bitwise and
#	or	-	bitwise or
#	slt	-	set on less than
#	nor	-	bitwise nor
#	addi	-	add with immediate data
#	beq	-	branch if equal
#	j	-	unconditional jump
#	lw	-	load word
#	sw	-	store word
#
#YOUR SUBMISSION WILL BE ASSIGNED A SCORE OF ZERO IF IT CONTAINS:
#	PSEUDOINSTRUCTIONS
#	SYNTAX ERRORS
#	INSTRUCTIONS NOT LISTED ABOVE
#Also for this assignment, use the following memory configureation:
#		Compact, Text at Address 0
#To set this configuration:
#	1. Go to the 'Settings' menu
#	2. Select 'Memory Configuration'
#	3. Click the radio button next to 'Compact, Text at Address 0'
#	4. Click 'Apply and Close'
#
########################################
.data
#arrays and variables are provided to be used with the given problems
array1:	.word	10,0,-20,40,-30	#array1 base address 0x2000
array2:	.word	0,0,0,0,0		#array2 base address 0x2014
A:		.word	111
B:		.word	211
C:		.word	345
D:		.word	0
array3:	.word	0,0,0,0,0
E:		.word	456	


# BEGIN EXAMPLE EXERCISES:
ex_array1:	.word	-1, 0, 3, 1, 2	#ex_array base address 2050
X:	.word	44		#X address = 0x2064
Y:	.word	22		#Y address = 0x2068
Z:	.word	33		#Z address = 0x206C

.text
#######################   EXAMPLES   #######################
# Example 1:  perform the given assignment statement
#	X = Y + Z
addi $10, $0, 0x2068	#put address of Y in $10
lw $11, 0($10)			#load value of Y into $11
addi $10, $0, 0x206c	#put address of Z in $10
lw $12, 0($10)		#load value of Z into $12
add $13, $11, $12		#$13 = Y + Z
addi $10, $0, 0x2064	#put address of X into $10
sw $13, 0($10)			#X = Y + Z = $13

# Example 2:  put the ex_array1 elements in ascending order
#	Use only load and store instructions
addi $10, $0, 0x2050	#$10 points to base array address
lw $11, 0x0($10)			#get ex_array1[0]; $11 = -1
lw $12, 0x4($10)			#get ex_array1[1]; $12 = 0
lw $13, 0x8($10)			#get ex_array1[2]; $13 = 3
lw $14, 0xC($10)			#get ex_array1[3]; $14 = 1
lw $15, 0x10($10)			#get ex_array1[4]; $15 = 2
sw $11, 0x0($10)			#ex_array1[0] = -1
sw $12, 0x4($10)			#ex_array1[1] = 0
sw $14, 0x8($10)			#ex_array1[2] = 1
sw $15, 0xC($10)			#ex_array1[3] = 2
sw $13, 0x10($10)			#ex_array1[4] = 3

#######################   END OF EXAMPLES   #######################
# Now for your assignment, complete the following exercises in order as they appear.
# Each exercise is part of a larger program and is to be done in order!
# The result of each exercise can depend on the result of previous exercises.
#	USE ANY CPU REGISTERS FOR ANY PURPOSE NECESSARY

#Exercise 1:  assignment statement
# D = (A - B) + (E - C)
#A = 2028, B = 202c, E = 204c, C = 2030

addi $10, $0, 0x2028
lw $11, 0($10)
addi $10, $0, 0x202c
lw $12, 0($10)
addi $10, $0, 0x204c
lw $13, 0($10)
addi $10, $0, 0x2030
lw $14, 0($10)
sub $1, $11, $12
sub $2, $13, $14
add $15, $1, $2

#Exercise 2:
# put array1 in descending order using only load and store instructions

addi $10, $0, 0x2000
lw $11, 0x0($10)
lw $12, 0x4($10)
lw $13, 0x8($10)
lw $14, 0xc($10)
lw $15, 0x10($10)
sw $15, 0x10($10)
sw $14, 0x0($10)
sw $13, 0xc($10)
sw $12, 0x8($10)
sw $11, 0x4($10)

#Exercise 3:
# for(i = 0; i < 5; i = i + 1)
#	array2[i] = i;

addi $10, $0, 0
addi $3, $0, 5
addi $11, $0, 0x2014
for_loop:
	slt $4, $10, $3
	beq $4, $0, end
		lw $12, 0x0($11)
		add $12, $0, $10
		sw $12, 0x0($11)
		addi $11, $11, 0x4
		addi $10, $10, 1
		j for_loop
end:

#Exercise 4:
# for(i = 0; i < 5; i = i + 1)
#	for(j = 0; j < (i+1); j = j + 1)
#		array3[i] += array2[j]

addi $10, $0, 0
addi $11, $0, 0
addi $3, $0, 5
addi $12, $0, 0x2014
addi $13, $0, 0x2038
forloop_i:
	slt $4, $10, $3
	beq $4, $0, endfor_i
		lw $14, 0x0($13)
		addi $15, $10, 1
		forloop_j:
			slt $5, $11, $15
			beq $5, $0, endfor_j
				lw $16, 0x0($12)
				add $14, $14, $16
				addi $11, $11, 1
				addi $12, $12, 0x4
				j forloop_j
		endfor_j:
		sw $14, 0x0($13)
		addi $10, $10, 1
		addi $13, $13, 0x4
		addi $11, $0, 0
		addi $12, $0, 0x2014
		j forloop_i
endfor_i:
