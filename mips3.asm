.eqv str_code 4
.eqv 
.data
	
	comma: .asciiz ", "
	printLine: .ascii "\n"

.text


addi $v0, $0, 5 # Read integer

syscall



addu $s0, $0, $v0 # Get integer
j printLineAct # first line to improve readability

loop: 
	addi $s2, $0, 1 # Reset second loop condition
	addi $t0, $s0, -1
	beq $t0, $s1, end # condition to indicate if all lines were printed, according to last condition, that indicates a n-1
	addi $s1, $s1, 1 # add to sec counter +1
	jal printThCounter 
	
printAllLine: # print a whole line with all numbers

	addi $s2, $s2, 1 #counter + 1
	bgt $s1, 1, printNumbers
	j printLineAct

printThCounter: # print a number from $s2 register and return to linked register
	move $a0, $s2
	
	addi $v0, $0, 1
	syscall
	jr $ra
	
printNumbers: # print a number whit a comma and a new line case necessary
	jal printComma
	jal printThCounter
	
	beq $s1, $s2, printLineAct
	j printAllLine
	
printLineAct: # print a new line
	addi $v0, $0, str_code
	la $a0, printLine
	syscall
	j loop

printComma: #print a comma

	addi $v0, $0, str_code
	
	la $a0, comma
	syscall
	jr $ra
	
end:

