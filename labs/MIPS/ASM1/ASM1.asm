#Rifa Safeer Shah
#Josh Hayter
#10/24/2019

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
#
#YOUR SUBMISSION WILL BE ASSIGNED A SCORE OF ZERO IF IT CONTAINS:
#	PSEUDOINSTRUCTIONS
#	SYNTAX ERRORS
#	INSTRUCTIONS NOT LISTED ABOVE
########################################
#########################################
## Example of how to perform exercises ##
#########################################
#Variables A through C have the following register mapping:
#	A:$16	B:$17	C:$18
#For temporary storage use registers $13, $14, or $15 as needed for complex operations.
#Example Exercise:	
#	Initial Variable Values: A = 50; B = 100; C = 150;
#	Assignment statement to perform: C = A + B - C;
addi $16, $0, 50	#A = 50;
addi $17, $0, 100	#B = 100;
addi $18, $0, 150	#C = 150;
add $13, $16, $17	#Temp = A + B;
sub $18, $13, $18	#C = A + B - C;
#########################################
## 	END		OF	EXAMPLE		SECTION	   ##
#########################################
########################################

########################################
#Now for your assignment, complete the following exercises in order as they appear.
#The result of each exercise can depend on the result of previous exercises.
#Variables A through F have the following register mapping:
#	A:$10	B:$11	C:$12	D:$13	E:$14	F:$15	G:$16	H:$17	I:$18
#For temporary storage use register $1 through $9 as needed for complex operations.

#Exercise 1:  Complex Assignment statement
#	Initial Variable Values: G = 10000; C = 12000; D = 5678;
#	Assignment statement to perform: H = G+(C-D)
addi $16, $0, 10000  #G = 10000;
addi $12, $0, 12000  #C = 12000;
addi $13, $0, 5678   #D = 5678;

sub $1, $12, $13    #C-D;

add $17, $16, $1    #H = G + (C-D)

#Exercise 2:  Sum of differences
#	Initial Variable Values: C = 2000; D = 1250; E = 5000; F = 3500; 
#	Assignment statement to perform: I = (C-D)+(E-F)
addi $12, $0, 2000    #C = 2000;
addi $13, $0, 1250    #D = 1250;
addi $14, $0, 5000    #E = 5000;
addi $15, $0, 3500    #F = 3500;

sub $1, $12, $13    #$1 = C - D;
sub $2, $14, $15    #$2 = E - F;

add $18, $1, $2     #I = (C-D) + (E-F);

#Exercise 3:  Add without adding
#	Initial Variable Values: A = 25; B = 50
#	Assignment statement to perform: G = A - (~B + 1);
addi $10, $0, 25    #A=25;
addi $11, $0, 50    #B=50;
nor $1, $0, $11     #~B
addi $2, $1, 1      #$2 = ~B + 1;
sub $16, $10, $2    #G = A - (~B+1);

#Exercise 4: Subtract without Subtracting
#	Initial Variable Values: C = 1000; D = 750;
#	Assignment statement to perform: F = C + (~D + 1)
addi $12, $0, 1000  #C=1000;
addi $13, $0, 750   #D=750;
nor $1, $0, $13     #~D;
addi $2, $1, 1      #~D+1;
add $15, $12, $2    #F=C+(~D+1);

#Exercise 5:  Less Than Comparison
#	Initial Variable Values: A = 20000; B = 30000
#	Assignment statement to perform: E = (A<B) ? 1 : 0; //ternary operator
addi $10, $0, 20000  #A=20000;
addi $11, $0, 30000  #B=30000;
slt $14, $10, $11    #E=(A<B) ? 1; 0;

#Exercise 6: Exclusive OR without XOR
#	Initial Variable Values:	B = 0x0F0F;	C = 0x0FFF;
#	Assignment statement to perform: D = (B & ~C) | (~B & C)
addi $11, $0, 0x0F0F   #B=0x0F0F;
addi $12, $0, 0x0FFF   #C=0x0FFF;
nor $1, $0, $11        #~B;
nor $2, $0, $12        #~C;
and $3, $11, $2        #B&~C;
and $4, $1, $12        #~B&C;
or $13, $3, $4        #D=(B&~C)|(~B&C)
