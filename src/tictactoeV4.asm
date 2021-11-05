
.data
output2:	.ascii "\n Invalid move! Please select the next free square (1-9):  \0"
output3:	.ascii "\n-----------------------\n\0"
output4:	.ascii "  \0"
output5:	.ascii "  | \0"
output6:	.ascii "X \0"
output7:	.ascii "O \0"
output8:	.ascii "- \0"
output9:	.ascii "\n Congratulations, X WINS!\0"
output10:	.ascii "\n Congratulations, O WINS!\0"
output11:	.ascii "\n GAME DRAW\0"
output13:	.ascii "\n To continue please choose (1 = yes, 0 = no)\0"

inputX:		.ascii "\n User X please select the next square (1-9):  \0"
inputO: 	.ascii "\n User O please select the next square (1-9):  \0"

nl:		.ascii "\n\0"

grid:  	.word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text

main:	addi t3, zero, 9	#Counter
	addi a2, zero, 1	#Value 1 will represent X.
	addi a3, zero, 2	#Value 2 will represent O.
	addi s0, zero, 3	#Counter for printing.
	addi s1, zero, 3	#Another counter for printing.
	add s9, zero, zero	#A flag to tell who's turn it is.

print:	li a7, 4		#This prints the current tic-tac-toe board
	la a1, grid

print1:	lw s8, 0(a1)		#This prints ' ' part of the board
	addi a1, a1, 4
	la a0, output4
	ecall
	beq s8, zero, line
	beq s8, a2, X

O:	la a0, output7		#This prints 'O' part of the board
	ecall
	addi s0, s0, -1
	bgtz s0, lineh
	j nline

X:	la a0, output6		#This prints 'X' part of the board
	ecall
	addi s0, s0, -1
	bgtz s0, lineh
	j nline

line:	la a0, output8		#This prints '-' part of the board
	ecall
	addi s0, s0, -1
	bgtz s0, lineh
	j nline

lineh:	la a0, output5		#This prints '|' part of the board
	ecall
	j print1

nline:	la a0, output3		#This prints '-----------------------' part of the board
	ecall
	addi s1, s1, -1
	addi s0, s0, 3
	bgtz s1, print1
	beq s9, zero, main2
	j main3
	

winX:	li a7, 4		#Same thing as print, except it also prints that player X wins.
	la a1, grid
	
prin1:	lw s8, 0(a1)
	addi a1, a1, 4
	la a0, output4
	ecall
	beq s8, zero, line1
	beq s8, a2, X1
	
O1:	la a0, output7
	ecall
	addi s0, s0, -1
	bgtz s0, lineh1
	j nline1
	
X1:	la a0, output6
	ecall
	addi s0, s0, -1
	bgtz s0, lineh1
	j nline1
	
line1:	la a0, output8
	ecall
	addi s0, s0, -1
	bgtz s0, lineh1
	j nline1
	
lineh1:	la a0, output5
	ecall
	j prin1
	
nline1:	la a0, output3
	ecall
	addi s1, s1, -1
	addi s0, s0, 3
	bgtz s1, prin1
	la a0, output9
	addi s10, zero, 1	#s10 used for unittest
	ecall
	j cont
	

winO:	li a7, 4		#Same thing as print, except it also prints that player O wins.
	la a1, grid
	
prin2:	lw s8, 0(a1)
	addi a1, a1, 4
	la a0, output4
	ecall
	beq s8, zero, line2
	beq s8, a2, X2
	
O2:	la a0, output7
	ecall
	addi s0, s0, -1
	bgtz s0, lineh2
	j nline
	
X2:	la a0, output6
	ecall
	addi s0, s0, -1
	bgtz s0, lineh2
	j nline2
	
line2:	la a0, output8
	ecall
	addi s0, s0, -1
	bgtz s0, lineh2
	j nline2
	
lineh2:	la a0, output5
	ecall
	j prin2
	
nline2:	la a0, output3
	ecall
	addi s1, s1, -1
	addi s0, s0, 3
	bgtz s1, prin2
	la a0, output10
	addi s10, zero, 2	#s10 used for unittest
	ecall
	j cont
	

draw:	li a7, 4		#Same thing as print, except it also prints that it was a draw.
	la a1, grid
	
prinw:	lw s8, 0(a1)
	addi a1, a1, 4
	la a0, output4
	ecall
	beq s8, zero, linew
	beq s8, a2, Xw
	
Ow:	la a0, output7
	ecall
	addi s0, s0, -1
	bgtz s0, linehw
	j nlinew
	
Xw:	la a0, output6
	ecall
	addi s0, s0, -1
	bgtz s0, linehw
	j nlinew
	
linew:	la a0, output8
	ecall
	addi s0, s0, -1
	bgtz s0, linehw
	j nlinew
	
linehw:	la a0, output5
	ecall
	j prinw
	
nlinew:	la a0, output3
	ecall
	addi s1, s1, -1
	addi s0, s0, 3
	bgtz s1, prinw
	la a0, output11
	addi s10, zero, 3	#s10 used for unittest
	ecall
	j cont	
	

main21:	li a7, 4		#Main for Player X
	la a0, output2		#This prints "Invalid move! The square is already occupied; please select again (1-9):"
	ecall
	
main2:	li a7, 4		#Load command to output string
	la a0, inputX		#This prints "User X please select the next square (1-9):"
	ecall
	li a7, 5		#Load command to input an integer
	ecall
	slti t1, a0, 10		#Catches an exception, index > 9.
	beq t1, zero, excep1
	slti t1, a0, 1		#Catches an exception, index < 1.
	bne t1, zero, excep1
	la a5, grid
	addi a0, a0, -1
	slli t1, a0, 2		#Multiply index by 4 (byte offset)
	add a5, a5, t1	
	lw a1, 0(a5)		#Make the '-' in this square an X.
	bgtz a1, main21
	addi a1, a1, 1		#The Value 1 represents X as described at the start
	sw a1, 0(a5)
	addi t3, t3, -1		#Lower counter by 1.
	addi s9, s9, 1		#Player O's turn is next
	addi s1, s1, 3
	j end1

main31:	li a7, 4		#Same as main21 and main2, except its for Player O
	la a0, output2		#This prints "Invalid move! The square is already occupied; please select again (1-9):"
	ecall
	
main3:	li a7, 4		#Load command to output string
	la a0, inputO		#This prints "User O please select the next square (1-9):"
	ecall
	li a7, 5		#Load command to input an integer
	ecall
	slti t1, a0, 10		#Catches an exception, index > 9
	beq t1, zero, excep2
	slti t1, a0, 1		#Catches an exception, index < 1
	bne t1, zero, excep2
	la a5, grid
	addi a0, a0, -1
	slli t1, a0, 2		#Multiply index by 4 (byte offset)
	add a5, a5, t1
	lw a1, 0(a5)		#Make the '-' in this square an O.
	bgtz a1, main31
	addi a1, a1, 2		#The Value 2 represents O as described at the start
	sw a1, 0(a5)
	addi t3, t3, -1		#lower counter by 1.
	addi s9, s9, -1		#Player X's turn is next
	addi s1, s1, 3
	j end2

#Exceptions for invalid index in main2 and main3
excep1:	li a7, 4
	la a0, output2		#This prints "Invalid index! Please select the next square (1-9):"
	ecall
	j main2

excep2: li a7, 4
	la a0, output2		#This prints "Invalid index! Please select the next square (1-9):"
	ecall
	j main3
	

#Check if Player X or Player O wins
#In end1 is determined if Player X wins
end1:	la a6, grid
	lw s4, 0(a6)		#Check if Row 1 (square 1-3) is filled with X
	lw s5, 4(a6)
	lw s6, 8(a6)
	beq s4, a2, cond2	#Check if X in square 1, if true check next square
	j next			#Jump to next Row if square 1 is not X	
cond2:	beq s5, a2, cond3	#Check if X in square 2, if true check next square
	j next	
cond3:	beq s6, a2, winX	#Check if X in square 3, if true Player X wins

next:	lw s4, 12(a6)		#Check if Row 2 (square 4-6) is filled with X
	lw s5, 16(a6)
	lw s6, 20(a6)
	beq s4, a2, cond12	#Check squares as described at Row1
	j next1
cond12:	beq s5, a2, cond13
	j next1
cond13:	beq s6, a2, winX

next1:	lw s4, 24(a6)		#Check if Row 3 (square 7-9) is filled with X
	lw s5, 28(a6)
	lw s6, 32(a6)
	beq s4, a2, cond22	#Check squares as described at Row1
	j next2
cond22:	beq s5, a2, cond23
	j next2
cond23:	beq s6, a2, winX

next2:	lw s4, 0(a6)		#Check if this diagonal '\' (square 1, 5, 9) is filled with X
	lw s5, 16(a6)
	lw s6, 32(a6)
	beq s4, a2, cond32	#Check squares as described at Row1
	j next3
cond32:	beq s5, a2, cond33
	j next3
cond33:	beq s6, a2, winX

next3:	lw s4, 8(a6)		#Check if this diagonal '/' (square 3, 5, 7) is filled with X
	lw s5, 16(a6)
	lw s6, 24(a6)
	beq s4, a2, cond42	#Check squares as described at Row1
	j next4
cond42:	beq s5, a2, cond43
	j next4
cond43:	beq s6, a2, winX

next4:	lw s4, 0(a6)		#Check if column 1 (square 1, 4, 7) is filled with X
	lw s5, 12(a6)
	lw s6, 24(a6)
	beq s4, a2, cond52	#Check squares as described at Row1
	j next5
cond52:	beq s5, a2, cond53
	j next5
cond53:	beq s6, a2, winX

next5:	lw s4, 4(a6)		#Check if column 2 (square 2, 5, 6) is filled with X
	lw s5, 16(a6)
	lw s6, 28(a6)
	beq s4, a2, cond62	#Check squares as described at Row1
	j next6
cond62:	beq s5, a2, cond63
	j next6
cond63:	beq s6, a2, winX

next6:	lw s4, 8(a6)		#Check if column 3 (square 3, 6, 9) is filled with X
	lw s5, 20(a6)
	lw s6, 32(a6)
	beq s4, a2, cond72	#Check squares as described at Row1
	j next7
cond72:	beq s5, a2, cond73
	j next7
cond73:	beq s6, a2, winX
	
next7:	bne t3, zero, print
	j draw			#Becaus Player X startet, X must win by 9th turn or it's a draw
	

#In end2 is determined if Player O wins
end2:	la a6, grid		#Same as end1 except it determines if Player O wins
	lw s4, 0(a6)		#Check if row 1 (square 1-3) is filled with O
	lw s5, 4(a6)
	lw s6, 8(a6)
	beq s4, a3, con2
	j nex
con2:	beq s5, a3, con3
	j nex
con3:	beq s6, a3, winO

nex:	lw s4, 12(a6)		#Check if row 2 (square 4-6) is filled with O
	lw s5, 16(a6)
	lw s6, 20(a6)
	beq s4, a3, con12
	j nex1
con12:	beq s5, a3, con13
	j nex1
con13:	beq s6, a3, winO

nex1:	lw s4, 24(a6)		#Check if row 3 (square 7-9) is filled with O
	lw s5, 28(a6)
	lw s6, 32(a6)
	beq s4, a3, con22
	j nex2
con22:	beq s5, a3, con23
	j nex2
con23:	beq s6, a3, winO

nex2:	lw s4, 0(a6)		#Check if this diagonal '\' (square 1, 5, 9) is filled with O
	lw s5, 16(a6)
	lw s6, 32(a6)
	beq s4, a3, con32
	j nex3
con32:	beq s5, a3, con33
	j nex3
con33:	beq s6, a3, winO

nex3:	lw s4, 8(a6)		#Check if this diagonal '/' (square 3, 5, 7) is filled with O
	lw s5, 16(a6)
	lw s6, 24(a6)
	beq s4, a3, con42
	j nex4
con42:	beq s5, a3, con43
	j nex4
con43:	beq s6, a3, winO

nex4:	lw s4, 0(a6)		#Check if column 1 (square 1, 4, 7) is filled with O
	lw s5, 12(a6)
	lw s6, 24(a6)
	beq s4, a3, con52
	j nex5
con52:	beq s5, a3, con53
	j nex5
con53:	beq s6, a3, winO

nex5:	lw s4, 4(a6)		#Check if column 2 (square 2, 5, 8) is filled with O
	lw s5, 16(a6)
	lw s6, 28(a6)
	beq s4, a3, con62
	j nex6
con62:	beq s5, a3, con63
	j nex6
con63:	beq s6, a3, winO

nex6:	lw s4, 8(a6)		#Check if column 3 (square 3, 6, 9) is filled with O
	lw s5, 20(a6)
	lw s6, 32(a6)
	beq s4, a3, con72
	j nex7
con72:	beq s5, a3, con73
	j nex7
con73:	beq s6, a3, winO
	
nex7:	j print


excep3:	j cont

#Clears the tic-tac-toe board for a new game.
clmain:	la a0, grid
	add a2, zero, zero
	
loop2:	slti t1, a2, 10
	beq t1, zero, main
	
loop:	lw a1, 0(a0)
	addi a2, a2, 1		#Counter for clearing data.
	add a1, zero, zero
	sw a1, 0(a0)
	addi a0, a0, 4		#Move to the next address.
	j loop2
	
#This sees if the user wants to continue or not.
cont:	
	li a7, 4		#Loads command to output string.
	la a0, output13		#This prints "Continue? (1 = yes, 0 = no)"
	ecall
	li a7, 5		#Loads command to input an integer
	ecall
	bltz a0, excep3		#Exception if input is a number other than 1 or 0
	slti t1, a0, 2
	beq t1, zero, excep3
	slti t1, a0, 1
	li a7, 4
	la a0, nl		#Prints new line ("\n")
	ecall
	beq t1, zero, clmain
	li a7, 10		#Exits program with code 0
	ecall
