#assignment 1
# question 9b
# Programs submitted by 15CO104 and 15CO118
# Factorial using recursion

.data
msg: .asciiz "Enter number: "
result: .ascii "Factorial = "
number: .word 0
answer: .word 0


.text

.globl main
main:
li $v0,4
la $a0,msg
syscall

li $v0,5
syscall

sw $v0,number

lw $a0,number
jal fact
sw $v0,answer

li $v0,4
la $a0,result
syscall

li $v0,1
lw $a0,answer
syscall

li $v0,10
syscall

# Factorial function
.globl fact
fact:
subu $sp,$sp,8
sw $ra,($sp)
sw $s0,4($sp)

li $v0,1
beq $a0,0,done

move $s0,$a0
sub $a0,$a0,1
jal fact
mul $v0,$s0,$v0 

done:
lw $ra,($sp)
lw $s0,4($sp)
addu $sp,$sp,8
jr $ra