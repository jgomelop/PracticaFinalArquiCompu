.text
main:
	# Cargar vector uno por uno

	addi $t0, $zero, 35
	sw $t0, 0($zero)
	addi $t0, $zero, 5
	sw $t0, 4($zero)
	addi $t0, $zero, 78
	sw $t0, 8($zero)

	
	# Ordenamiento por burbuja
	addi $s0, $zero, 2 # Longitud del vector -1
	add $s1, $zero, $zero #i
	add $s2, $zero, $zero #j

for_externo:
	bge  $s1,$s0,contar_paridad # for i in range(0, n-1)
	
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

contar_paridad:
	
	add $s6, $zero, $zero # contador para números pares
	
	add $t0, $zero, $zero #inicializamos $t0 = 0. Contador
	la $t1, ($zero) # Apuntador al inicio del vector
	
	# si es impar, BSD = 1, 0 si es par
check_paridad:
	bge  $t0,$s0,Exit
	lw $a0, ($t1)
	andi $t2, $a0 , 0x01 # 1 si es impar, 0 si es par
	beqz $t2, sumar_si_par
else_sumar_si_par:
	addi $t0, $t0, 1
	addi $t1, $t1, 4 
	j check_paridad

sumar_si_par: 
	addi $s6, $s6, 1
	j else_sumar_si_par
	
Exit:
	# Cálculo de impares
	addi $s0, $s0, 1
	sub $s5, $s0, $s6 # s5 tiene la cantidad de impares
	
