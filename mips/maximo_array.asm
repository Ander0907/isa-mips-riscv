.data
    max:        .word 100                      # Tamaño máximo permitido
    arreglo:    .space 400                     # Espacio para 100 enteros (4 * 100)
    mensajeN:   .asciiz "Ingrese la cantidad de elementos del arreglo: "
    mensajeNum: .asciiz "Ingrese un numero: "
    mensajeMax: .asciiz "El valor maximo del arreglo es: "

.text
.globl main

main:
    # Solicitar N
    li $v0, 4
    la $a0, mensajeN
    syscall

    li $v0, 5
    syscall
    move $t1, $v0          # $t1 = N

    la $t0, arreglo        # $t0 = base del arreglo
    li $t2, 0              # $t2 = índice

lectura_loop:
    beq $t2, $t1, encontrar_max

    li $v0, 4
    la $a0, mensajeNum
    syscall

    li $v0, 5
    syscall
    move $t3, $v0          # $t3 = número leído

    mul $t4, $t2, 4
    add $t5, $t0, $t4
    sw $t3, 0($t5)         # guardar número

    addi $t2, $t2, 1
    j lectura_loop

encontrar_max:
    li $t2, 0
    lw $t6, 0($t0)         # $t6 = valor máximo actual (iniciamos con arreglo[0])

buscar_max:
    addi $t2, $t2, 1
    beq $t2, $t1, imprimir

    mul $t4, $t2, 4
    add $t5, $t0, $t4
    lw $t3, 0($t5)         # $t3 = arreglo[t2]

    bgt $t3, $t6, actualizar_max
    j buscar_max

actualizar_max:
    move $t6, $t3
    j buscar_max

imprimir:
    li $v0, 4
    la $a0, mensajeMax
    syscall

    li $v0, 1
    move $a0, $t6          # valor máximo
    syscall

    li $v0, 10
    syscall