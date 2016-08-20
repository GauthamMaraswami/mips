#assignment 1
# question 11
# Programs submitted by 15CO104 and 15CO118
# Find first 100 prime numbers

.data
.align 4
msg: .asciiz "First 100 prime numbers are -\n "
MSG4: .asciiz " "
new_line: .asciiz "\n"


.text
.globl main
main:
li $v0, 4
la $a0, msg
syscall

add $fp,$zero,$sp#initialize frame pointer
addi $s0,$zero,0#prime counter
addi $s1,$zero,100#set limit to 100
addi $s2,$zero,0#number being checked
addi $s3,$zero,10
addi $s4,$zero,100


main_loop:
beq $s0,$s1,main_loop_done
add $a0,$zero,$s2
jal test_prime
beq $v0,$zero,prime_continue#check condition
addi $s0,$s0,1#counter++
sub $t0,$s2,$s3
bgez $t0,not_single#check for single digit
li $v0,4#prints a space before the number
la $a0,MSG4
syscall

not_single:  
sub $t0,$s2,$s4
bgez $t0,not_double#checks for digit length
li $v0,4
la $a0,MSG4
syscall

not_double:
# Print prime
li $2,1
add $4,$zero,$s2
syscall

li $v0,4
la $a0,MSG4    
syscall

div $s0,$s3
mfhi $t0
bgtz $t0,prime_continue
li $v0,4
la $a0,new_line    
syscall
 
prime_continue:
addi $s2,$s2,1
beq $zero,$zero,main_loop#loop

#exit
main_loop_done:
li$v0,10
syscall
 

# Input: integer value n
# Return: 1 if n is prime and 0 if n is not prime
.text
test_prime:
addi $sp,$sp,-4			# decrement by 1
sw $ra,($sp)			# save return address on stack
addi $sp,$sp,-4
sw $fp,($sp)			# save fp on stack
addi $sp,$sp,-4
sw $s2,($sp)			# save s2 on stack
addi $sp,$sp,-4
sw $s3,($sp)
addi $sp,$sp,-4
addi $fp,$sp,32			# set $fp
addi $s2,$zero,1		# put 1 in s2
bne  $s2,$a0,not_one
add $v0,$zero,$zero
beq $zero,$zero,exit_prime


not_one: 
addi $s2,$zero,2			# put immediate value 2 in  s2
beq $a0,$s2,three_done		# two is a prime
div $a0,$s2					# divide
mfhi $t0#					# get remainder
bgtz $t0,three
add $v0,$zero,$zero			# if so not a prime
beq $zero,$zero,exit_prime
three:
addi $s2,$s2,1				# s2++
 
three_loop:
add $t0,$zero,$zero					# clear reg
mult $s2,$s2						# $s2^2
mflo $s3							# get answer
sub $t0,$a0,$s3						# is s2 > a0^.5 
bltz $t0,three_done
div $a0,$s2							# divide
mfhi $t0							# get remainder
bgtz $t0,three_cont					# is $a0 multiple of $s2  
add $v0,$zero,$zero
beq$zero,$zero,exit_prime

three_cont:
addi $s2,$s2,2						# skip multiples of 2 and 3
beq $zero,$zero,three_loop

three_done:							# number is a prime
addi $v0,$zero,1

# essentially reverse of test_prime
exit_prime:
addi $sp,$sp,4
lw $s3,($sp)
addi $sp,$sp,4
lw $s2,($sp)
addi $sp,$sp,4
lw $fp,($sp)
addi $sp,$sp,4
lw $ra,($sp)
addi $sp,$sp,4

jr $ra