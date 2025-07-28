.data
    max:        .word 100                      # Máximo tamaño permitido
    arreglo:    .space 400                     # Reservamos 100 palabras (100*4 bytes)
    mensajeN:   .asciiz "Ingrese la cantidad de elementos del arreglo: "
    mensajeNum: .asciiz "Ingrese un número: "
    mensajeRes: .asciiz "La suma del arreglo es: "

.text
.globl main

main:
    # Mostrar mensaje para N
    li $v0, 4
    la $a0, mensajeN
    syscall

    # Leer N
    li $v0, 5
    syscall
    move $t1, $v0        # $t1 = N

    # Cargar dirección base del arreglo
    la $t0, arreglo      # $t0 = base del arreglo
    li $t2, 0            # $t2 = índice
    li $t3, 0            # $t3 = suma

lectura_loop:
    beq $t2, $t1, suma_loop   # Si índice == N, pasamos a la suma

    # Mostrar mensaje para cada número
    li $v0, 4
    la $a0, mensajeNum
    syscall

    # Leer número
    li $v0, 5
    syscall
    move $t4, $v0

    # Guardar número en el arreglo
    mul $t5, $t2, 4       # desplazamiento = índice * 4
    add $t6, $t0, $t5     # dirección donde guardar
    sw $t4, 0($t6)

    addi $t2, $t2, 1      # índice++
    j lectura_loop

suma_loop:
    li $t2, 0             # Reiniciamos índice
    li $t3, 0             # Reiniciamos suma

sumar:
    beq $t2, $t1, imprimir

    mul $t5, $t2, 4
    add $t6, $t0, $t5
    lw $t4, 0($t6)

    add $t3, $t3, $t4
    addi $t2, $t2, 1

    j sumar

imprimir:
    # Mostrar mensaje
    li $v0, 4
    la $a0, mensajeRes
    syscall

    # Mostrar suma
    li $v0, 1
    move $a0, $t3
    syscall

    # Salir
    li $v0, 10
    syscall
