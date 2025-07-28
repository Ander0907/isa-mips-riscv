.data
    mensajeN:   .asciiz "Ingrese un numero para calcular su factorial: "
    mensajeRes: .asciiz "El factorial es: "

.text
.globl main

main:
    # Mostrar mensaje para ingresar N
    li $v0, 4
    la $a0, mensajeN
    syscall

    # Leer N
    li $v0, 5
    syscall
    move $t0, $v0          # $t0 = N

    # Inicializar resultado factorial = 1
    li $t1, 1              # $t1 = factorial acumulado
    li $t2, 1              # $t2 = contador i

loop:
    bgt $t2, $t0, fin      # Si i > N, salir del bucle

    mul $t1, $t1, $t2      # factorial *= i
    addi $t2, $t2, 1       # i++

    j loop

fin:
    # Mostrar mensaje
    li $v0, 4
    la $a0, mensajeRes
    syscall

    # Mostrar resultado (factorial)
    li $v0, 1
    move $a0, $t1
    syscall

    # Salir
    li $v0, 10
    syscall
