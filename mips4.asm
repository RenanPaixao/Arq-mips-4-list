.data
	floatZero: .float 0.0
	equal: .asciiz "x igual a y"
	lesser: .asciiz "x menor do que y"
	greater: .asciiz "x maior do que y"
.text

	lwc1 $f1, floatZero # reserva um valor 0 floatado para fazer operações com outros floats

	addi $v0, $0, 6 # Lê o float
	syscall
	
	add.s $f3, $f0, $f1 # passa o float para um registrador impar (usados pra single precision)
	
	addi $v0, $0, 6 # Lê um novo float
	syscall
	
	add.s $f5, $f0, $f1 # passa o float para um registrador impar
	
	c.lt.s $f5, $f3 # se y < x -> printa a mensagem de maior
	bc1t printGreater 
	
	c.lt.s $f3, $f5 # se x < y -> printa a mensagem de menor
	bc1t printLesser
	
	j printEqual # printa a mensagem de igual caso nenhum dos casos acima aconteçam
	
printGreater:
	addi $v0, $0, 4
	la $a0, greater
	syscall
	j end
	
printLesser:
	addi $v0, $0, 4
	la $a0, lesser
	syscall
	j end

printEqual:
	addi $v0, $0, 4
	la $a0, equal
	syscall
end: