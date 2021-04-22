 .data
even: .asciiz " even "
odd: .asciiz " odd "

.text
.globl  main
main:
 
  li $a0 , 9
  jal isodd
  beq $v0 , 1 , Podd   
  j Peven         

 Podd:
 	li $v0 , 4        
 	la $a0 , odd
 	syscall       
	j Exit       
 
 Peven: 
	li $v0 , 4
	la $a0 , even
	syscall       

 Exit:
     li $v0 , 10
     syscall
 
 
 

isodd:
	addi $sp , $sp , -4
 	sw $ra , 0($sp) 
	jal iseven       
	beq $v0 , $0 , Otrue   
	j Ofalse
	
Otrue:
	li $v0 , 1
	j Endodd

Ofalse:
	li $v0 , 0
	
Endodd:
	lw $ra , 0($sp)   
	addi $sp , $sp , 4
	jr $ra 
	
iseven: 
	rem $t0 , $a0 , 2    
	beq $t0 , $0 , Etrue  
	j Efalse

Etrue:
	li $v0 , 1   
	j Endeven  


Efalse:
	li $v0 , 0 


Endeven:
	jr $ra    
