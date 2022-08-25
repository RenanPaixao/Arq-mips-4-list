.data
	trueString: .asciiz "TRUE"
	falseString: .asciiz "FALSE"
.text

addi $v0, $0, 5 # Read integer

syscall

addu $s0, $0, $v0 # Get first integer

# -------------------------------------

addi $v0, $0, 5 # Read integer

syscall

addu  $s1, $0, $v0 # Get second integer

# -------------------------------------

addi $v0, $0, 5 # Read integer

syscall

addu  $s2, $0, $v0 # Get third integer

# -------------------------------------

addi $v0, $0, 5 # Read integer

syscall

addu $s3, $0, $v0 # Get last integer

# -------------------------------------

# First assert

add $t0, $s0, $s3

beq $t0, 7, printTrue

# Second assert

seq $t1, $s1, 2 # B is equal 2
sne $t2, $s2, 5 # C is not equal 5

seq $t3, $t1, $t2

beq $t3, 1, printTrue

# Else

b printFalse


# -------------------------------------

printTrue:
	
	la $a0, trueString
	addi $v0, $0, 4
	syscall 
	b end

printFalse:

	la $a0, falseString
	addi $v0, $0, 4
	
	syscall 
	
end:
	addi $v0, $0, 10
	syscall