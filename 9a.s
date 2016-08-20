#assignment 1
# question 9a
# Programs submitted by 15CO104 and 15CO118
# Factorial using loops

.data	
prmpt: .asciiz "Enter number: "
answer: .asciiz "Factorial = "

.text
.globl main

main:
li $v0,4
la $a0,prmpt
syscall
	
li $v0,5
syscall

move $s1,$v0
	
li $v0,1
add $a0,$s1,$zero
syscall

addi $t0,$s1,0			# store input

li $t1,1				# counter
li $t2,1				# factorial value

jal fact	

#display result
li $v0,4
la $a0,answer
syscall
	
addi $s2,$t2,0		
li $v0,1
move $a0,$s2
syscall

li $v0,10
syscall

fact:
loop: 
bgt $t1,$t0,end
mul $t2,$t2,$t1
add $t1,$t1,1
j loop		

end:
jr $ra