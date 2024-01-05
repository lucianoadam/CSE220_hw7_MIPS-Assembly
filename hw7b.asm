.data
# You can use the following for the pretty printing the 
# input and output as described in the homework document
A:		.asciiz "A["
B:		.asciiz "B["
C:		.asciiz "]="

.align 2
pinA: 		.space	400				# We will not change this
pinB: 		.space	400				# We will not change this
m: 		.word	n  				# We can change this 
              						# n x 4 <= 400 This is the constraint
mem_err:	.asciiz	"Not enough memory allocated"	# Error message if there is not enough memory to allocate each array
too_small:	.asciiz "m must be greater than 0"	# Error message if no items can be added to the arrays


.text

la $s0, pinA		# Load base address of array A into $s0
la $s1, pinB		# Load base address of array B into $s1

li $t0, 1		# Use $t0 as iterating variable
lw $s2, m		# Load the number of elements into register $s2

mul $t1, $s2, 4		# Get the total memory each array occupies
ble $t1, 400, check_m	# If There is enough aloocated memoty, continue execution

li $v0, 4		# Syscall to print string
la $a0, mem_err		# Load the address of error message into $a0
syscall
j exit			# Exit the program

check_m:
bgtz $s2, printLoop	# If the length of the arrays is greater than 0, continue execution

li $v0, 4		# Syscall to print string
la $a0, too_small	# Load the address of error message into $a0
syscall
j exit			# Exit the program
	
printLoop:	
	bgt $t0, $s2, printLoop_out	# Loop condition
	
	li $v0, 4			# Syscall to print string
	la $a0, A			# Load the address of A into $a0
	syscall
	move $a0, $t0			# Load the index into $a0
	jal printIndex			# Print the index
	jal printC			# Print "]="
	li $v0, 5			# Syscall to get integer input
	syscall
	sw $v0, 0($s0)			# Load $v0 into A[i]
	
	li $v0, 4			# Syscall to print string
	la $a0, B			# Load the address of B into $a0
	syscall
	move $a0, $t0			# Load the index into $a0
	jal printIndex			# Print the index
	jal printC			# Print "]="
	li $v0, 5			# Syscall to get integer input
	syscall
	sw $v0, 0($s1)			# Load $v0 into B[i]
	
	addi $s0, $s0, 4		# Increment array A by sizeof(int)
	addi $s1, $s1, 4		# Increment array B by sizeof(int)
	addi $t0, $t0, 1		# Increment iterating variable by 1
	
	j printLoop			# Repeat the loop

printLoop_out:
	jal printNewLine	# Print newline

	la $s0, pinA		# Reset $s0 to A[0]
	la $s1, pinB		# Reset $s1 to B[0]

	li $t0, 1		# Use $t0 as iterating variable

swapLoop:
	bgt $t0, $s2, exit	# Loop condition
	
	lw $t1, 0($s0)		# Save A[i] into $t1
	lw $t2, 0($s1)		# Save B[i] into $t2
	sw $t1, 0($s1)		# Set B[i[ to $t1
	sw $t2, 0($s0)		# Set A[i] to $t2
	
	li $v0, 1		# Syscall to print integer
	lw $a0, 0($s0)		# Load A[i] into $a0
	syscall
	li $v0, 11		# Syscall to print char
	li $a0, ' '		# Load ' ' into the character to be printed
	syscall
	li $v0, 1		# Syscall to print integer
	lw $a0, 0($s1)		# Load B[i] into $a0
	syscall
	li $v0, 11		# Syscall to print char
	li $a0, '|'		# Load '|' into the character to be printed
	syscall
	
	addi $s0, $s0, 4	# Increment array A by sizeof(int)
	addi $s1, $s1, 4	# Increment array B by sizeof(int)
	addi $t0, $t0, 1	# Increment iterating variable by 1
	
	j swapLoop

exit:
	li $v0, 10	# Syscall to exit program
	syscall
	
printNewLine:
	li $v0, 11	# Syscall to print char
	li $a0, '\n'	# Load '\n' into argument
	syscall
	jr $ra		# Return
	
printC:
	li $v0, 4	# Syscall to print string
	la $a0, C	# Load the address of C into $a0
	syscall
	jr $ra		# Return
	
printIndex:
	li $v0, 1	# Syscall to print integer
	syscall
	jr $ra		# Return
	
