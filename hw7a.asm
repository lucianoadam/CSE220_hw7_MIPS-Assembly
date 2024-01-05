.data
	prompt1: 	.asciiz "Triangle(0) or Square(1) or Pyramid (2)? "	# Prompt to pick shape
	prompt2: 	.asciiz "Required size? "				# Prompt to specify size
	err1:		.asciiz "Shape choice must be in range 0 <= x <= 2"	# Error message if shape choice is not within range
	err2:		.asciiz "Size must be in range 0 < x"			# Error message if shape choice is not within range


.text

main:
	li $v0, 4			# Syscall to print string
	la $a0, prompt1			# Load prompt1 into argument
	syscall 
	li $v0, 5			# Syscall to get int input
	syscall
	move $s0, $v0			# Store shape choice in $s0
	bgt $s0, 2, error1		# Error if selection is greater than 2
	blt $s0, 0, error1		# Error if selection is less than than 0
	jal printNewLine		# Print newline
	
	li $v0, 4			# Syscall to print string
	la $a0, prompt2			# Load prompt1 into argument
	syscall
	li $v0, 5			# Syscall to get int input
	syscall
	move $s1, $v0			# Store size in $s1
	ble $s1, 0, error2		# Error if size is less than or equal to 0
	jal printNewLine		# Print newline
	
	blez  $s1, exit			# if size <= 0 it is invalid so exit
	subi $s1, $s1, 1		# $s1-- so that index can start at 0
	
	move $a0, $s1			# Set $a0 to the size requested
	
	li $t0, 0			# Load 0 into $t0 for condition
	beq $t0, $s0, triangle		# If choice == 0 then run triangle
	li $t0, 1			# Load 1 into $t0 for condition
	beq $t0, $s0, square		# If choice == 1 then run square
	li $t0, 2			# Load 2 into $t0 for condition	
	addi $a0, $s1, 1		# Pyramid requires index to start at 1
	beq $t0, $s0, pyramid		# If choice == 2 then run pyramid
	
	exit:
		li $v0, 10	# Load syscall to exit program
		syscall
	
	
triangle:
	li $t0, 0	# Use $t0 as iterating variable
	
	triangleLoop:
		bgt $t0, $a0, exit	# Loop condition
		
		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Store $a0 below the return address
		move $a0, $t0		# Set $a1 to the current index
		jal starLoop		# Print desired stars
		jal printNewLine	# Print newline
		lw $a0, 0($sp)		# Restore argument
		addi $sp, $sp, 4	# Restore stack pointer
		
		addi $t0, $t0, 1	# Increment iterating variable
		j triangleLoop		# Continue loop
	
	
square:
	li $t0, 0	# Use $t0 as iterating variable

	squareLoop:
		bgt $t0, $a0, exit	# Loop condition
		
		jal starLoop		# Print desired stars
		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Store $a0 below the return address
		jal printNewLine	# Print newline
		lw $a0, 0($sp)		# Restore argument
		addi $sp, $sp, 4	# Restore stack pointer
		
		addi $t0, $t0, 1	# Increment iterating variable
		j squareLoop		# Continue loop
	
	
pyramid:
	li $t0, 1	# Use $t0 as iterating variable

	pyramidLoop:
		bgt $t0, $a0, exit	# Loop condition

		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Temporarily store argument in stack

		sub $t1, $a0, $t0	# Calculate the number of spaces necessary

    		spacesLoop:
        		ble $t1, 0, outSpacesLoop	# Nested Loop condition
        		li $v0, 11			# Syscall to print space
        		li $a0, ' '			# Load ' ' into $a0
        		syscall
        		subi $t1, $t1, 1		# Decrement iterating variable
        		j spacesLoop			# Continue nested loop

		outSpacesLoop:
			sll $t2, $t0, 1	# Multiplying $t0 by 2 to use as bound for next loop

    		starOrSpaceLoop:
        		bge $t1, $t2, starOrSpaceLoop_out	# Loop condition
        		and $t3, $t1, 1				# Check if $t1 is even
        		beq $t3, 1, space			# If odd, print ' '
        		li $v0, 11				# Syscall to print char
        		li $a0, '*'				# Load '*' into $a0
        		syscall
        		j continue				# Continue nested loop
        		space:
        			li $v0, 11	# Syscall to print char
        			li $a0, ' '	# Load ' ' into $a0
        			syscall
        		continue:
        			addi $t1, $t1, 1	# $t1++
        			j starOrSpaceLoop	# Continue nested loop

    		starOrSpaceLoop_out:
			subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
			sw $ra, 0($sp)		# Store old return address at the top of the stack
			jal printNewLine	# Print newline
			lw $ra, 0($sp)		# Restore old return address
			addi $sp, $sp, 4	# Restore stack pointer
			
			lw $a0, 0($sp)		# Restore old argument
			addi $sp, $sp, 4	# Restore stack pointer

        		addi $t0, $t0, 1	# $t0++
        		j pyramidLoop		# Continue loop
	
	
printNewLine:
	li $v0, 11	# Syscall to print char
	li $a0, '\n'	# Load '\n' into argument
	syscall
	jr $ra		# Return


starLoop:
	li $t3, 0	# Use $t3 as iterating variable
	
	loop:
		bgt $t3, $a0, out_loop	# Loop condition
		subi $sp, $sp, 4	# Decrement stack pointer by 4 bytes
		sw $a0, 0($sp)		# Store old argument at the top of the stack
		li $v0, 11		# Syscall to print char
		li $a0, '*'		# Load '*' into the argument
		syscall
		lw $a0, 0($sp)		# Restore old argument
		addi $sp, $sp, 4	# Restore stack pointer
		addi $t3, $t3, 1	# Increment iterating variable 
		j loop			# Continue loop
		
	out_loop:
		jr $ra			# Return
		
		
error1:
	jal printNewLine	# Print newline
	li $v0, 4		# Syscall to print string
	la $a0, err1		# Print error message 1
	syscall
	j exit			# Terminate execution
	
error2:
	jal printNewLine	# Print newline
	li $v0, 4		# Syscall to print string
	la $a0, err2		# Print error message 2
	syscall
	j exit			# Terminate execution
