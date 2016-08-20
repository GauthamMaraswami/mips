#assignment 1
# question 3
# Programs submitted by 15CO104 and 15CO118
# Print Hello World

.data
msg: .asciiz "Hello World"

.text
.globl main

main:
addi $v0,$0,4
la $a0,msg
syscall

add $v0,$0,10
syscall
