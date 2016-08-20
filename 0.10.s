#assignment 1
# question 10
#This is a program to Read a positive integer and print its equivalent in words. Eg. If input is 123, output will be One Two Three.
#programmed by Gautham M 15c0118 cse batch1  and Aditya Bisht 15co104 on 11-08-2016 as part of CO200 assignment
#data segment
.data

msg: .asciiz"enter the number:"
op1: .asciiz"One "
op2: .asciiz"Two "
op3: .asciiz"Three "
op4: .asciiz"Four "
op5: .asciiz"Five "
op6: .asciiz"Six "
op7: .asciiz"Seven "
op8: .asciiz"Eight "
op9: .asciiz"Nine "
op0: .asciiz"Zero "

.text
.globl main
main:       
la $a0, msg
    li $v0, 4
    syscall

    li   $v0, 5
    syscall
    move $s0, $v0
   lpt:
    blez $s0, rev1
    add $s1, $s0, 0
    addi $t1, $0, 10
    div $s0, $s0, $t1
    mul $t4, $s0, $t1
    sub $t2, $s1, $t4
    mul $t3, $t3, $t1
    add $t3, $t3, $t2
    j lpt
    rev1:
      addi $s0, $t3, 0
      lp: 
      blez $s0, fail
      add $s1, $s0, 0
      addi $t1, $0, 10
      div $s0, $s0, $t1
      mul $t4, $s0, $t1
      sub $t2, $s1, $t4
      beq $t2, 1, one
      beq $t2, 2, two
       beq $t2, 3, three
        beq $t2, 4, four
         beq $t2, 5, five
          beq $t2, 6, six
           beq $t2, 7, Seven
            beq $t2, 8, eight
             beq $t2, 9, nine
              beq $t2, 0, zero
      one:
           la $a0, op1
           li $v0, 4
           syscall
           j e1
      two:
           la $a0, op2
           li $v0, 4
           syscall
           j e1
      three:
           la $a0, op3
           li $v0, 4
           syscall
           j e1
      four:
           la $a0, op4
           li $v0, 4
           syscall
           j e1
      five:
           la $a0, op5
           li $v0, 4
           syscall
           j e1
           six:
           la $a0, op6
           li $v0, 4
           syscall
           j e1
           Seven:
           la $a0, op7
           li $v0, 4
           syscall
           j e1
           eight:
           la $a0, op8
           li $v0, 4
           syscall
           j e1
           nine:
           la $a0, op9
           li $v0, 4
           syscall
           j e1
           zero:
           la $a0, op0
           li $v0, 4
           syscall
           j e1
       e1:
         j lp

   fail:
   add $v0, $0, 10           #exit sys call 10
syscall