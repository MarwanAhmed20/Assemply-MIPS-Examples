.data  
my_msg: .asciiz "True\n"
.text  
.globl  main
main:

   li $s0 , 0
   
   blt $s0 , $s1 , Else
   bgt $s0 , $0 , Else
   move $0,$1
   
   
   j Exit
   Else: 
   	move $s1 , $s0 
   Exit:	
	li $v0, 4
   	la $a0, my_msg
   	syscall

.end main
