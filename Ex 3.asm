.data 

n1: .word 0x40100000 #2.25
n2: .word 0x41280000 #10.5
n3: .word 0x7FFFFF                #0000 0000 0111 1111 1111 1111 1111 1111         
n4: .word 0x800000                #0000 0000 1000 0000 0000 0000 0000 0000        

.text

 .globl main
 main:
  la $s0 , n1
  lw $s1 , ($s0) #s1 = n1 
  la $s2 , n2
  lw $s3 , ($s2)  #s3 = n2
  la $s4 , n3
  lw $s5 , ($s4) #s5 = n3
  la $s6 , n4
  lw $s7 , ($s6) #s7 = n4
  
  beq $s1, 0, num2
  beq $s3, 0, num1
  
  srl $t0 , $s1 , 23   #t0 is Exponent	of n1
  srl $t1 , $s3 , 23   #t1 is Exponent	of n2
  srl $t4 , $s1 , 31   #t4 is sign of n1
  srl $t5 , $s1 , 31   #t5 is sign of n2
  
  and $t2 , $s1 , $s5  #t2 is mantissa of n1
  and $t3 , $s3 , $s5  #t3 is mantissa of n2
  
  or $t2 , $t2 , $s7   #with leading one t2
  or $t3 , $t3 , $s7   #with leading one t3
  
  
  subi $t6 , $t0 , 127
  subi $t7 , $t1 , 127
  
  beq $t6 , $t7 , equal 
  blt $t6 , $t7 , less
  bgt $t6 , $t7 , great
  
  equal:
  
  	add $t4 , $t2 , $t3
  	move $t9 , $t0
	j checkOverflow
  		
  less:
  
  	sub $t8 , $t7 , $t6
 	srlv $t2 , $t2 , $t8
 	add $t4 , $t2 , $t3
 	move $t9 , $t1
 	j checkOverflow

  
  great:
  
  	sub $t8 , $t6 , $t7
 	srlv $t3 , $t3 , $t8
 	add $t4 , $t2 , $t3
 	move $t9, $t0
 	j checkOverflow
 	
 checkOverflow:
 	srl $v1, $t4, 24
 	beq $v1, $0, zero
 	srl $t4, $t4, 1
 	addi $t9, $t9, 1
 zero:
 	and $t4 , $t4 , $s5
 	j  Exit
 Exit:  
  sll $a0 , $t9 , 23
  or $a0 , $a0 , $t4	
 	
 end:
  li $v0,10
  syscall
  
 num1:
 	move $a0, $s1
 	j end
 num2:
 	move $a0, $s3
 	j end