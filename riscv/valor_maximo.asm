.data
mensaje:   .string "Ingrese un número: "
.align 2               # Asegura que `array` esté alineado a 4 bytes
array:     .space 12   # espacio para 3 enteros (3 x 4 bytes)
size:      .word 3


.text
.globl main
main:
    la t0, array       # dirección base para guardar los números
    li t1, 0           # contador i

lectura:
    lw t2, size
    beq t1, t2, calcular_max

    # Mostrar mensaje
    li a7, 4
    la a0, mensaje
    ecall

    # Leer número del usuario
    li a7, 5
    ecall

    sw a0, 0(t0)       # guardar en array[i]

    addi t0, t0, 4     # siguiente posición del array
    addi t1, t1, 1     # i++
    j lectura

calcular_max:
    la t0, array
    lw t1, size
    lw t2, 0(t0)       # max = array[0]
    addi t0, t0, 4     # avanzar al segundo elemento
    li t3, 1           # i = 1

loop:
    beq t3, t1, imprimir
    lw t4, 0(t0)
    blt t4, t2, skip
    mv t2, t4          # max = array[i]

skip:
    addi t0, t0, 4
    addi t3, t3, 1
    j loop

imprimir:
    li a7, 1           # syscall 1: imprimir entero
    mv a0, t2
    ecall

    li a7, 10          # syscall 10: salir
    ecall
