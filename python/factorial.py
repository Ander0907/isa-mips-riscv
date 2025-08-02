def main():
    print("Ingrese un numero para calcular su factorial: ")
    N = int(input())

    factorial = 1
    i = 1        

    while True:
        if i > N:
            break

        factorial = factorial * i
        i += 1

    print(f"El factorial es: {factorial}")

if __name__ == "__main__":
    main()