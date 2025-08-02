.data
mensaje: .string "Ingrese un número: "

.text
.globl main
main:
    # Mostrar mensaje
    li a7, 4           # syscall 4: imprimir string
    la a0, mensaje
    ecall

    # Leer número ingresado por el usuario
    li a7, 5           # syscall 5: leer entero
    ecall
    mv t0, a0          # guardar el número en t0

    # Inicializar resultado factorial
    li t1, 1           # t1 = resultado = 1

loop:
    beqz t0, end       # si t0 == 0, terminar
    mul t1, t1, t0     # t1 *= t0
    addi t0, t0, -1    # t0--
    j loop

end:
    li a7, 1           # syscall 1: imprimir entero
    mv a0, t1          # a0 = resultado
    ecall

    li a7, 10          # syscall 10: salir
    ecall
