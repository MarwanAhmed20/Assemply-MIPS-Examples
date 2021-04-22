 .data
arr:  .space 12

.text
.globl  main
main:
 li $s0, 0
 li $s1, 0
 li $s2, 10
 la $s6, arr
 
 start: 
 blt $s0, $s2, loop1
 loop1:
 	blt $s1 , $s0 , loop2
 	add $s0 , $s0 , $1
 loop2:
 	lw $s7 , 0($s6)
 	addu $s7 , $s7, $s1
 	add $s1 , $s1 , $1
 	j start
	
li $v0 , 10
syscall
