.data
    max:        .word 100                      # M�ximo tama�o permitido
    arreglo:    .space 400                     # Reservamos 100 palabras (100*4 bytes)
    mensajeN:   .asciiz "Ingrese la cantidad de elementos del arreglo: "
    mensajeNum: .asciiz "Ingrese un n�mero: "
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

    # Cargar direcci�n base del arreglo
    la $t0, arreglo      # $t0 = base del arreglo
    li $t2, 0            # $t2 = �ndice
    li $t3, 0            # $t3 = suma

lectura_loop:
    beq $t2, $t1, suma_loop   # Si �ndice == N, pasamos a la suma

    # Mostrar mensaje para cada n�mero
    li $v0, 4
    la $a0, mensajeNum
    syscall

    # Leer n�mero
    li $v0, 5
    syscall
    move $t4, $v0

    # Guardar n�mero en el arreglo
    mul $t5, $t2, 4       # desplazamiento = �ndice * 4
    add $t6, $t0, $t5     # direcci�n donde guardar
    sw $t4, 0($t6)

    addi $t2, $t2, 1      # �ndice++
    j lectura_loop

suma_loop:
    li $t2, 0             # Reiniciamos �ndice
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
