
.text
.globl main
main:
	# Cargar vector uno por uno
	li $t0, 35
	sw $t0, 0($zero)
	li $t0, 5
	sw $t0, 4($zero)
	li $t0, 78
	sw $t0, 8($zero)
	li $t0, -30
	sw $t0, 12($zero)
	li $t0, -57
	sw $t0, 16($zero)
	li $t0, 83
	sw $t0, 20($zero)
	li $t0, -37
	sw $t0, 24($zero)
	li $t0, 96
	sw $t0, 28($zero)
	li $t0, -76
	sw $t0, 32($zero)
	li $t0, -93
	sw $t0, 36($zero)
	li $t0, -86
	sw $t0, 40($zero)
	li $t0, -64
	sw $t0, 44($zero)
	li $t0, -46
	sw $t0, 48($zero)
	li $t0, 83
	sw $t0, 52($zero)
	li $t0, 17
	sw $t0, 56($zero)
	li $t0, 47
	sw $t0, 60($zero)
	

	
	# Test
	# Cargar vector uno por uno
	#li $t0, 1
	#sw $t0, ($zero)
	#li $t0, -50
	#sw $t0, 4($zero)
	#li $t0, 4
	#sw $t0, 8($zero)
	#li $t0, 4
	#sw $t0, 12($zero)
	#li $t0, -1
	#sw $t0, 16($zero)
	#li $t0, 6
	#sw $t0, 20($zero)
	
	# Ordenamiento por burbuja
	
	li $s0, 15 # Longitud del vector -1
	
	add $s1, $zero, $zero #i
	add $s2, $zero, $zero #j

for_externo:
	bge  $s1,$s0,Exit # for i in range(0, n-1)
	
	#addi $t0, $s1, 1 # aux = i + 1
	sub $s4, $s0, $s1 # n = n - aux 
	add $s2, $zero, $zero #j
for_interno:
	bge  $s2,$s4,end_for_externo # for j in range(0, n-i-1)
   	
   	sll $a0, $s2, 2 # j = 4*i
   	lw $t0, ($a0) # vector[j]
   	
   	addi $a1, $a0, 4 #j + 1
   	lw $t1, ($a1) # vector[j+1]
   	
   	#if vector[j] > vector[j+1]
   	# < para ordenamiento descendente
   	bge  $t0, $t1, end_for_interno 
   	jal intercambia # Intercambio vector[j] y vector[j+1]
   	
end_for_interno:
	addi $s2, $s2, 1
	j for_interno	
	
end_for_externo:
	addi $s1, $s1, 1   	
   	j for_externo  
		
######################
# Funciones #
######################

intercambia:
	lw $t0, ($a0) # $t0 = vector[j] 
	lw $t1, ($a1) # $t1 = vector[j + 1]
	sw $t1, ($a0) # vector[j] = vector[j+1] = $t1
	sw $t0, ($a1) # vector[j+1] = $t0
	jr $ra

Exit: