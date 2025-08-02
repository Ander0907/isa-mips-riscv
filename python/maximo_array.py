def main():
    print("Ingrese la cantidad de elementos del arreglo: ")
    N = int(input())

    arreglo = [0] * N

    indice = 0
    while indice != N:
        print("Ingrese un numero: ")
        numero = int(input())
        arreglo[indice] = numero
        indice += 1

    indice = 0
    maximo = arreglo[0] if N > 0 else None

    while True:
        indice += 1
        if indice == N:
            break

        valor_actual = arreglo[indice]

        if valor_actual > maximo:
            maximo = valor_actual

    print(f"El valor maximo del arreglo es: {maximo}")

if __name__ == "__main__":
    main()