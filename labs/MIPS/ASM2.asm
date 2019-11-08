#Use the MARS simulator to write and execute MIPS assembly code that will perform
#the high level language pseudocode assignment statements.
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
#
#YOUR SUBMISSION WILL BE ASSIGNED A SCORE OF ZERO IF IT CONTAINS:
#	PSEUDOINSTRUCTIONS
#	SYNTAX ERRORS
#	INSTRUCTIONS NOT LISTED ABOVE
########################################

########################################
#Now for your assignment, complete the following exercises in order as they appear.
#Each exercise is part of a larger program and is to be done in order!
#The result of each exercise can depend on the result of previous exercises.

#Variables A through F have the following register mapping:
#	A:$10	B:$11	C:$12	D:$13	E:$14	F:$15
#For temporary storage use register $1 through $9 as needed for complex operations.

#The program will begin with the following register initializations
addi $10, $0, 10	#A = 10
addi $11, $0, 20	#B = 20
addi $12, $0, 30	#C = 30
addi $13, $0, 40	#D = 40
addi $14, $0, 50	#E = 50
addi $15, $0, 60	#F = 60

#Example 1:
#	if(A < B)
#		F = B;
#	else
#		F = A;
slt $1, $10,$11
beq $1, $0, AnotlessB
	add $15, $0, $11
	j endif_example
AnotlessB:
	add $15, $0, $10
endif_example:
########################################
#	Exercise 1:  if else statements
#	if(F < A)
#		F = F + 1;
#	else if(F < B)
#		F = F - 1;
#	else
#		F = 0x4444

addi $9, $0, 1            	#temp = 1
slt $1, $15, $10        	#if F < A: 0 or 1
beq $1, $0, FNotLessA        	#if $1 is not true then FNotLessA
    add $15, $15, $9    	#F = F + 1
    j EndIf_exercise1    	#go to end Exercise 1
FNotLessA:            		#FnotLessA -> F < B
slt $2, $15, $11        	#if F < B: 0 or 1
beq $2, $0, FNotLessB        	#if F is not less than B then FNotLessB
    sub $15, $15, $9    	#F = F - 1
    j EndIf_exercise1    	#go to end Exercise 1
FNotLessB:            		#else F = 0x4444
addi $15, $0, 0x4444        	#F = 0x4444
EndIf_exercise1:        	#ends Exercise 1

########################################
#Exercise 2:  for loop
# for(A = 0; A < 5; A++)
#	E = E + E;

addi $10, $0, 0            	#A = 0
addi $1, $0, 5            	#temp = 5
loop:                		#makes a loop
    slt, $2, $10, $1    	#if A < 5: 0 or 1
    beq $2, $0, exit    	#A = 5 then exit
    add $14, $14, $14    	#E = E + E
    add $10, $10, $9    	#adds 1 to A
    j loop            		#go to loop
exit:                		#end Exercise 2

########################################
#Exercise 3: do while loop with nested if
#	do{
#		B += 2;
#		if(B == C)
#			B = B*2;
#	}while(B < D)

addi $9, $0, 2            	#temp = 2
doWhile:            		#start dowhile
    add $11, $11, $9     	#B = B + 2
    beq $11, $12, BequalsC     	#Check if B == C
    slt $1, $11, $13     	#Checks if B < D, Gives 0 or 1
    beq $1, $0, end     	#ends program when B = D
    j doWhile         		#Loops if didnt end
BequalsC:            		#if B == C
add $11, $11, $11        	#B = B*2
j doWhile            		#continue the dowWhile
end:                		#end Exercise 3

########################################
#Exercise 4:  while loop
#	D = 0
#	while( 5000 > C)
#	{	D++;
#		C +=C;
#	}

addi $9, $0, 1            	#temp = 1
addi $13, $0, 0            	#D = 0
addi $1, $0, 5000        	#temp = 5000
whileLoop:            		#WhileLoop
    slt $2, $12, $1     	#if C < 5000: 0 or 1
    beq $2, $0, endEx    	#ends when c > 4999
    add $13, $13, $9    	#D = D + 1
    add $12, $12, $12    	#C = C + C
    j whileLoop        		#loop
endEx:                		#end Exercise 4
