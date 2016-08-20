.data
  a: .word 21
  k: .word 32
  c: .space 4
  msg: .asciiz"insert sucessful\n"
  msg1: .asciiz"\nthe sum is:"
 .text
 .globl main
 main:
 lw $t0, a
 sw $t0, 0($gp)
 lw $t1, k
 sw $t1, 0x8000($gp)
 la $t3, 0x8000($gp)
 addi $t3, $t3, -400
 add $t4, $t0, $t1
 sw $t4, 0($t3)
 lw $t7, 0($t3)
 addi $v0, $0, 4
la  $a0, msg
syscall
addi $v0, $0, 4
la  $a0, msg1
syscall
 addi $v0, $0, 1
add $a0, $t7, 0
syscall
addi $v0, $0, 10
syscall
