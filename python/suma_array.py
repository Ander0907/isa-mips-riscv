def main():
    N = int(input("Ingrese la cantidad de elementos del arreglo: "))
    arreglo = []

    for i in range(N):
        num = int(input("Ingrese un número: "))
        arreglo.append(num)
    
    suma = sum(arreglo)
    print("La suma del arreglo es:", suma)

if __name__ == "__main__":
    main()