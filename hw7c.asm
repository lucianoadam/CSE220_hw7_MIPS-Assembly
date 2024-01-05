.data
	M:      .space 400  		# int M[][] The matrix
	V:      .space 400  		# int V[]   The vector
	C:      .space 400  		# int C[] : The output vector
	m:      .word 10   		# m is an int whose value is at most 10
                     			# max value for rows and columns
        row_m: 	.word 6			# rows for matrix M:    This should not be more than 10        			
	col_m: 	.word 3			# columns for matrix M: This should not be more than 10
					# (col_m * row_m) * 4 <= M
	row_v: 	.word 3			# rows for vector V. This should not be more than 10
	col_v: 	.word 1			# colums for vector V. For a vector, the column is always one
					# (col_v * row_v) * 4 <= V

	enter_element:		.asciiz "Enter element "	# Used for preety printing input
	equals_space:		.asciiz " = "			# Same here
	comma_space:		.asciiz ", "			# Same here as well

	dimension_error:	.asciiz "NOT WORKABLE BECAUSE OF THE DIMENSIONS"	# Error message for incompatible dimensions
	memory_error:		.asciiz "NOT WORKABLE BECAUSE OF THE MEMORY"		# Error message for memory errors
	max_dim_error:		.asciiz "DIMENSION EXCEEDS M"				# Error message if any dimension exceeds m
  	not_a_vector_error:	.asciiz	"NO VECTOR INPUTTED"				# Error message if dimensions of v do not make a vector
  	invalid_m:		.asciiz "M IS INVALID"					# Error message if the value of m is invalid
  	
	matrix_title:	.asciiz "Matrix:\n"	# Used to print title for matrix when reading
	vector_title:	.asciiz "Vector:\n"	# Used to print title for vector when reading
	result_title:	.asciiz "\nResult: "	# Used to show where the result is


.text

main:
	lw $s0, row_m			# $t2 initialized to rows of the matrix to check dimension
	lw $s1, col_m			# $t0 initialized to the columns of the matrix to check compatibility
	lw $s2, row_v			# $t1 initialized to the rows of the vector to check compatibility
	lw $s3, col_v			# $t3 initialized to the columns of the vector
	bne  $s1, $s2, dim_err		# If matrix columns and vector rows are not equal, there is an error
	ble $s0, 0, dim_err		# If dimension is 0 or lower, there is an error
	ble $s1, 0, dim_err		# If dimension is 0 or lower, there is an error
	ble $s2, 0, dim_err		# If dimension is 0 or lower, there is an error
	ble $s3, 0, dim_err		# If dimension is 0 or lower, there is an error
	
	lw $t0, m			# Load max dimension into $t0
	
	ble $t0, 0, m_invalid		# If max dimension is 0 or lower, there is an error
	
	bgt $s0, $t0, max_dim_err	# Check if number of rows in matrix exceed m
	bgt $s1, $t0, max_dim_err	# Check if number of columns in matrix exceed m
	bgt $s2, $t0, max_dim_err	# Check if number of rows in matrix exceed m
	bgt $s3, 1, not_a_vector	# Check if number of columns in vector exceed 1
		
	mul $t1, $s0, $s1		# Set $t1 to the total cells in the matrix
	mul $t1, $t1, 4			# Set $t1 to the total memory the matrix occupies
	bge $t1, 400, mem_error		# If $t1 exceeds 400, then there is a memory error
		
	mul $t1, $s2, 4			# Set $t1 to the total memory the vector occupies
	bge $t1, 400, mem_error		# If $t1 exceeds 400, then there is a memory error
		
	j no_error			# If no errors were found, continue execution

	dim_err:
		li $v0, 4		# Syscall to print string
		la $a0, dimension_error	# Load error message into argument
		syscall
		j exit			# Terminate the program

	max_dim_err:
		li $v0, 4		# Syscall to print string
		la $a0, max_dim_error	# Load error message into argument
		syscall
		j exit			# Terminate the program
		
	not_a_vector:
		li $v0, 4			# Syscall to print string
		la $a0, not_a_vector_error	# Load error message into argument
		syscall
		j exit				# Terminate the program
						
	mem_error:
		li $v0, 4		# Syscall to print string
		la $a0, memory_error	# Load error message into argument
		syscall
		j exit			# Terminate the program
		
	m_invalid:
		li $v0, 4		# Syscall to print string
		la $a0, invalid_m	# Load error message into argument
		syscall
		j exit			# Terminate the program	
	
	no_error:
		li $v0, 4		# Syscall to print string
		la $a0, matrix_title	# Loading title of matrix to $a0
		syscall
		
		move $a0, $s0		# Set $a0 to the number of rows in the matrix
		move $a1, $s1		# Set $a1 to the number of columns in the matrix
		jal read_matrix		# Read the matrix
		move $s4, $v0		# Set $s0 to the pointer to the matrix
		
		jal print_newline	# Print newline
		
		li $v0, 4		# Syscall to print string
		la $a0, vector_title	# Loading title of vector to $a0
		syscall
		
		move $a0, $s2		# Set $a0 to the total number of items in the vector
		jal read_vector		# Read the vector
		move $s5, $v0		# Set $s1 to the pointer to the vector
		
		jal print_newline	# Print newline
		
		li $v0, 4		# Syscall to print string
		la $a0, result_title	# Loading title of result to $a0
		syscall
		
		move $a0, $s2		# Set $a0 to the total number of items in the vector
		la $a1, ($s4)		# Set $a1 to the pointer to the matrix
		la $a2, ($s5)		# Set $a2 to the pointer to the vector
		move $a3, $s0		# Set $a3 to the rows of the matrix
		jal MVM			# Multiply the matrix by the vector
		move $s6, $v0		# Store the result of the multiplication in $s2
		
		jal print_newline	# Print newline
		
		li $v0, 11		# Syscall to print char
		li $a0, '<'		# Load vector start into $a0
		syscall
		
		move $a0, $s0		# Set $a0 to the total length of the output vector
		la $a1, ($s6)		# Set $a1 to the output vector
		jal print_vector	# Print the vector
		
		li $v0, 11		# Syscall to print char
		li $a0, '>'		# Load vector end into $a0
		syscall
		
		
exit:
	addi $v0, $0, 10      	# system call code 10 for exit
	syscall               	# exit the program

MVM:
	la $t0, C	# Load array pointer into $t0
	li $t1, 0	# Set $t1 to 0 to use as iterating variable
	
	loop1:
		bge $t1, $a3, loop1_end	# Loop 1 condition

		li $t2, 0		# Use $t2 to keep track of sum
		li $t3, 0		# Set $t3 to 0 to use as iterating variable
		
		loop2:
			bge $t3, $a0, loop2_end	# Loop 2 condition
			
			mul $t4, $t1, $a0	# $t4 = i * n
			add $t4, $t4, $t3	# $t4 = i * n + j
			mul $t4, $t4, 4		# $t4 *= sizeof(int)
			add $t4, $t4, $a1	# $t4 holds the address of the desired value in $a1
			lw $t4, 0($t4)		# $t4 holds the desired value in $a1
			
			move $t5, $t3		# $t5 = j
			mul $t5, $t5, 4		# $t5 *= sizeof(int)
			add $t5, $t5, $a2	# $t5 holds the address of the desired value in $a2
			lw $t5, 0($t5)		# $t5 holds the desired value in $a2
			
			mul $t4, $t4, $t5	# $t4 *= $t5
			add $t2, $t2, $t4	# $t2 += $t4
			
			add $t3, $t3, 1		# $t3++
			j loop2			# Continue loop
			
		loop2_end:
			sw $t2, 0($t0)		# Save sum into C[i]
			
			addi $t1, $t1, 1	# $t1++
			addi $t0, $t0, 4	# $t0 += sizeof(int)
			j loop1			# Continue loop
			
	loop1_end:
		mul $t1, $t1, 4		# $t1 *= 4
		sub $t0, $t0, $t1	# Resetting $t0 to point to the beginning of the array
		move $v0, $t0		# Move return value into $v0
    		jr $ra			# Return

read_vector:
	la $a1, V		# Load array pointer into $t0
	subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
	sw $ra, 0($sp)		# Store old return address at the top of the stack
	jal read		# Read items into $a1
	lw $ra, 0($sp)		# Restore old return address
	addi $sp, $sp, 4	# Restore stack pointer
	jr $ra			# Return
	
read_matrix:
	mul $a0, $a0, $a1	# Set $a0 to the total length of the matrix array
	la $a1, M		# Load array pointer into $a1
	subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
	sw $ra, 0($sp)		# Store old return address at the top of the stack
	jal read		# Read items into $a1
	lw $ra, 0($sp)		# Restore old return address
	addi $sp, $sp, 4	# Restore stack pointer
	jr $ra			# Return


print_vector:
	subi $a0, $a0, 1	# Decrement $a0 to print al items except for the last
	li $t0, 0		# Set $t0 to 0 to use as iterating variable
	
	pLoop:
		bge $t0, $a0, pLoop_end	# Loop condition
		
		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Store old argument at the top of the stack
		
		li $v0, 1		# Syscall to print integer
		lw $a0, 0($a1)		# Load ith element in the array into argument
		syscall
		
		li $v0, 4		# Syscall to print char
		la $a0, comma_space	# Load item separator into argument
		syscall
		
		lw $a0, 0($sp)		# Restore old argument
		addi $sp, $sp, 4	# Restore stack pointer
		
		addi $t0, $t0, 1	# $t0++
		addi $a1, $a1, 4	# $a1 += sizeof(int)
		
		j pLoop			# Continue loop
		
	pLoop_end:
		li $v0, 1	# Syscall to print integer
		lw $a0, 0($a1)	# Load last element in the array into argument
		syscall
		jr $ra		# Return
	
print_newline:
	li $v0, 11	# Syscall to print character
	li $a0, '\n'	# Set argument to newline character
	syscall
	jr $ra		# Return
	
read:
	li $t0, 0	# Set $t0 to 0 to use as iterating variable
	
	rLoop:
		bge $t0, $a0, rLoop_end	# Loop condition
		
		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Store old argument at the top of the stack
		
		li $v0, 4		# Syscall to print string
		la $a0, enter_element	# First part of prompt
		syscall
		
		li $v0, 1		# Syscall to print integer
		add $a0, $t0, 1		# $a0 = $t0 + 1
		syscall
		
		li $v0, 4		# Syscall to print string
		la $a0, equals_space	# Last part of prompt
		syscall
		
		li $v0, 5		# Syscall to get integer input
		syscall
		sw $v0, 0($a1)		# Save input into X[i]
		
		lw $a0, 0($sp)		# Restore old argument
		addi $sp, $sp, 4	# Restore stack pointer
		
		addi $t0, $t0, 1	# $t0++
		addi $a1, $a1, 4	# $a1 += sizeof(int)
		j rLoop			# Continue loop
		
	rLoop_end:
		mul $t0, $a0, 4		# $t1 = n * sizeof(int)
		sub $a1, $a1, $t0	# Setting $a1 to point to the start of the array
	
		move $v0, $a1		# Set return value to new vector
		jr $ra			# Return
