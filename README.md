# isa-mips-riscv

Este repositorio contiene la implementación de tres algoritmos clásicos, desarrollados en lenguaje ensamblador para las arquitecturas **MIPS (usando MARS)** y **RISC-V**:

- **Suma de un arreglo de datos:** Dado un arreglo de `N` enteros, calcula la suma de todos sus elementos.
- **Búsqueda del valor máximo en un arreglo:** Recorre un arreglo de `N` enteros y devuelve el valor máximo encontrado.
- **Factorial de un número (N!):** Calcula el factorial de un número `N` utilizando un bucle iterativo.

---

## Tecnologías y herramientas

- **MIPS**: Ensamblador para MIPS, compatible con el simulador [MARS](https://dpetersanderson.github.io/download.html)
- **RISC-V**: Código en ensamblador para arquitectura RISC-V (se especifica en cada carpeta o archivo)

---

## Cómo usar

### Para ejecutar los algoritmos en MIPS

1. Descargar e instalar el simulador MARS desde:  
   [https://dpetersanderson.github.io/download.html](https://dpetersanderson.github.io/download.html)

2. Abrir el archivo `.asm` correspondiente en MARS.

3. Ejecutar el programa y seguir las instrucciones en consola.

---

## Consideraciones

- Los valores de entrada para el cálculo del factorial deben estar en el rango permitido para evitar overflow (generalmente `0 <= N <= 12` en MIPS con enteros de 32 bits).
- Para otros algoritmos, se recomienda modificar los arreglos y valores directamente en el código fuente antes de ejecutar.
- El código está comentado para facilitar la comprensión de cada paso y registro usado.
