#assignment 1
# question 1
# Programs submitted by Aditya Bisht 15CO104 and Gautham M 15CO118
# load two 32b (word) constants to $t0 and $t1. Add them and store the sum in $t2.
.data
	n: .word 9
	m: .word 10
.text
.globl main
main:
	la $t5, n
	lw $t0, 0($t5)
	la $t5, m
	lw $t1, 0($t5)
	add $t2, $t1, $t0
	addi $v0, $0, 1
	add $a0, $t2, $0
	syscall
add $v0, $0, 10
syscall