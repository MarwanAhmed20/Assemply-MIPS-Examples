   .data
vowel:      .asciiz     "aAeEiIoOuU"
msg: .asciiz     "Enter string: "
msg_out:    .asciiz     "Number of vowels is: "
str:        .space      80

    .text
    .globl  main
main:

#print message
    li      $v0,4
    la      $a0,msg
    syscall

#read a string
    li      $v0,8
    la      $a0,str
    li      $a1,80
    syscall

    li      $s2,0                   
    la      $s0,str                

stringLoop:
    lb      $t0,0($s0)              
    addiu   $s0,$s0,1               
    beqz    $t0,stringDone         

    la      $s1,vowel               

vLoop:
    lb      $t1,0($s1)              
    beqz    $t1,stringLoop         
    addiu   $s1,$s1,1               
    bne     $t0,$t1,vLoop      
    addi    $s2,$s2,1               
    j       stringLoop             

stringDone:
   
    li      $v0,4
    la      $a0,msg_out
    syscall

    li      $v0,1
    move    $a0,$s2
    syscall

 
    li      $v0,10
    syscall
