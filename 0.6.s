#assignment 1
# question 6
#This is a program to practice implementation of functions in mips that  takes the given array and prints the sum and average of the 5 membered array
#programmed by Gautham M 15c0118 cse batch1  and Aditya 15co104 Bisht on 11-08-2016 as part of CO200 assignment
#data segment

.data      

      numbers: .space 300
      count: .word 5   
      ans1: .asciiz " sum = "
      ans2: .asciiz "\n average ="
      endl: .asciiz "\n"
	  msg1: .asciiz"\nEnter number of elements:"
	  msg: .asciiz"\nenter array elements:"
     
.text

 

main:
		 addi $t0, $0, 0
        addi $v0, $0, 4
       la  $a0, msg1
       syscall
	   li   $v0, 5
       syscall
        move $s1, $v0
		addi $v0, $0, 4
       la  $a0, msg
       syscall
	   addi $t7, $s1, 0
	   mul $t7, $t7, 4
	   lp1:  	   #t3,addr of array elements,t4 tempvar
       
	   beq $t0, $t7, getout
        li   $v0, 5
       syscall
       move $s0, $v0
       sw $s0, numbers($t0)
    addi $t0, $t0, 4
     j lp1
     getout:
      la $a0, numbers         # load array address
      addi $a1, $s1 ,0          # load number of elements    
      jal sum                 # call sum function
      move $a0, $v1 
      addi $v0, $0, 4
      la  $a0, ans1
      syscall
        jal print
      div $s1, $a0, $a1 
      addi $v0, $0, 4
      la  $a0, ans2
      syscall
      addi $v0, $0, 1
       add $a0, $zero, $s1
      syscall
      j finish               # finish
      
 

sum:

     beq $t2, $a1, done      #if t2>=$a1, goto done
     lw  $t0, 0($a0)         #load value at addr a0 to t0
      add $t1, $t1, $t0       # sum = sum + array[i]
      addi $a0, $a0, 4        # add addr by 4 to get the address of   next value in the array
      addi $t2, $t2, 1        # i = i + 1
     j sum


done:

      move $v1, $t1           # move result to v1
      jr   $ra                #go to return addr

 

print:

      # code to print ansl, sum and end
    addi $v0, $0, 1
    add $a0, $t1, 0
    syscall
    jr $ra                  # return

 

finish:
      li $v0, 10    # exit
      syscall   