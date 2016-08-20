#assignment 1
# question 4
#This is a program Initialize a contiguous chunk of memory to contain 10 two digit decimal numbers.  Your program should
# calculate the sum of these numbers and put the result into $v0
#programmed by Gautham M 15c0118 cse batch1  and Aditya Bisht 15Co104 on 11-08-2016 as part of CO200 assignment

.data
arr: .space 40
msg: .asciiz"\nSum of array elements:"
msg1: .asciiz"\n enter the elements"

.text
.globl main
main:                    #t0 ctr,t1,sum,t2,constant,
 
 addi $t0, $0, 0
 addi $t1, $0, 40 
 addi $v0, $0, 4
la  $a0, msg1
syscall
 lp1:                       #t3,addr of array elements,t4 tempvar
 beq $t0, $t1, getout
     li   $v0, 5
    syscall
    move $s0, $v0
    sw $s0, arr($t0)
    addi $t0, $t0, 4
j lp1
     getout:
addi $t0, $0, 0
addi $t1, $0, 0
addi $t2, $0, 10
la $t3, arr
loop:
beq $t0, $t2, end
lw $t4, 0($t3)
add $t1, $t1, $t4
add $t0, $t0, 1
add $t3, $t3, 4
j loop

end:
addi $v0, $0, 4
la  $a0, msg
syscall
addi $v0, $0, 1
add $a0, $t1, 0
syscall
addi $v0, $0, 10
syscall
#add $a0,$t1,$0
#syscall

#add $v0,$0,10
#sycall