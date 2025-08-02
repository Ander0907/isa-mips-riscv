.data
array:      .space 12          # 3 enteros x 4 bytes = 12 bytes
mensaje:    .string  "Ingrese un número: "
salida:     .string  "La suma es: "

.text
.globl main
main:
    la t0, array       # Dirección base del arreglo
    li t1, 3           # Cantidad de números a ingresar
    li t2, 0           # Contador

leer_numeros:
    beq t2, t1, sumar_numeros

    # Imprimir mensaje
    li a7, 4
    la a0, mensaje
    ecall

    # Leer número entero
    li a7, 5
    ecall

    # Guardar en el arreglo
    sw a0, 0(t0)
    addi t0, t0, 4     # avanzar en el arreglo
    addi t2, t2, 1
    j leer_numeros

sumar_numeros:
    la t0, array       # Reiniciar dirección del arreglo
    li t2, 0           # Reiniciar contador
    li t3, 0           # suma = 0

loop_suma:
    beq t2, t1, imprimir_resultado
    lw t4, 0(t0)       # leer valor
    add t3, t3, t4     # acumular
    addi t0, t0, 4
    addi t2, t2, 1
    j loop_suma

imprimir_resultado:
    # Imprimir mensaje de salida
    li a7, 4
    la a0, salida
    ecall

    # Imprimir la suma
    li a7, 1
    mv a0, t3
    ecall

    # Finalizar programa
    li a7, 10
    ecall
