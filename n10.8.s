#assignment 1
# question 8
#this is a program to implement multiplication of matrices in mips the matrices are already initialized in the data segment and the output displays the product of two matrices
#programmed by Gautham M 15c0118 cse batch1  and Aditya Bisht 15co104 on 10-08-2016 as part of CO200 assignment
.data
    
	

    space:   .asciiz" "
    newline: .asciiz"\n"

    print3:  .asciiz"\n product of enterd matrices is:"
	matrix1: .word 1, 1, 1, 1, 1, 1, 1, 1, 1
	matrix2: .word 1, 1, 1, 1, 1, 1, 1, 1, 1
	matrix3: .space 40
	size: .word 3
	.text
	.globl main
	
	main:
	la $a0, matrix1
	la $a1, matrix2
	jal mulmat
	li $v0, 10    # exit
        syscall   



	mulmat:
    add $s0, $0, 3
   li $t1, 0           # i = 0
    K1: 
        li $t2, 0       # j = 0
        K2: 
            li  $t3, 0  # k = 0
            add $s1, $zero, $zero

            inner:
                mul $s3, $t1, $s0  # i * n
                add $s4, $s3, $t3  # i * n + k
                mul $s4, $s4, 4    # 4 * (i * n + k)
                lw  $t4, matrix1($s4)

                mul $s3, $t3, $s0  # k * n
                add $s4, $s3, $t2  # k * n + j
                 mul $s4, $s4, 4    # 4 * (k * n + j)

                lw $t5, matrix2($s4)

                mul $t6, $t4, $t5  # x[i][k] * y[k][j]
                add $s1, $s1, $t6  # z[i][j] = z[i][j] + x[i][k] * y[k][j]

                add $t3, $t3, 1
                bne $t3, $s0, inner

            mul $s3, $t1, $s0  #i*n
            add $s4, $s3, $t2 #i*n+j
            mul $s4, $s4, 4   #4*(i*n+j)
            sw  $s1, matrix3($s4)

            add $t2, $t2, 1  #j=j+1
            bne $t2, $s0, K2 #test loop condition

        add $t1, $t1, 1  #i=i+1
        bne $t1, $s0, K1 #test loop condition

      la $a0, print3
    li $v0, 4
    syscall

    li $t1, 0  #i=0

    L3:
        li $t2, 0  #j=0
        la $a0,  newline     
        li $v0, 4
        syscall 

        loop3:
            mul $t3, $t1, $s0  # i * n
            add $t3, $t1, $t2  # i * n + j
            mul $t3, $t3, 4    # 4 * (i * n + j)
            lw  $t4, matrix3($t3)
            add $a0, $t4, $zero
            li  $v0, 1
            syscall
            la  $a0,  space      
            li  $v0, 4
            syscall
            add $t2, $t2, 1
            bne $t2, $s0, loop3

        add $t1, $t1, 1
        bne $t1, $s0, L3

    li $v0, 10
    syscall
   
    jr $ra


    