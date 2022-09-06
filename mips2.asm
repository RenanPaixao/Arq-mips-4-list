.eqv r_string_code 8
.eqv r_char_code 12

.data
	buffer: .space 128
.text

li $v0, r_string_code #read string
la $a0, buffer
li $a1, 20
syscall

lw $s0, ($a0) # storage string

#---------------------------------
li $v0, r_char_code # reading char
li $a1, 1
syscall

lw $s1, ($a0) # storage char

#---------------------------------
li $v0, r_char_code # reading char
li $a1, 1
syscall

lw $s2, ($a0) # storage char

#---------------------------------

li $k0, 0 # counter

loop:
	add $t0, $s0, $k0
	
swap:
	la $t0, ($s2)

end:
	
li $v0, 10 
syscall



