#assignment 1
# question 5
# Programs submitted by 15CO104 and 15CO118
# Reverse string

.data
    string: .asciiz "string"
    size: .word 6

.text
main: 
    la $a0,string   #load address of reserved string space
    lw $a1,size  #load address of saved int length for string    
#    syscall

    lw $t0,size
    add $a1,$zero,$t0   #pass length of string
    jal stringreverse   #reverse the string

stringreverse:
    add $t0,$a0,$zero   #starting address
    add $t1,$zero,$zero     #i = 0
    addi $t2,$a1,-1     #j = length-1

loop:
    add $t3,$t0,$t1
    lb $t4,0($t3)   #the lb string[i]
    add $t5,$t0,$t2
    lb $t6,0($t5)   #the lb string[j]
    sb $t4,0($t5)   #string[j] = string[i]
    sb $t6,0($t3)   #string[i] = string[j]
    addi $t1,$t1,1  #i++
    addi $t2,$t2,-1     #j--

    slt $t6,$t2,$t1
    beqz $t6,loop

exit:
    li $v1, 4       #system call to print reversed string
    la $a2, 0($a1)
    syscall

    li $v0, 10
    syscall         # Exit program