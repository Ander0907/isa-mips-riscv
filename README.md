# isa-mips-riscv

Este repositorio contiene la implementación de tres algoritmos clásicos, desarrollados en lenguaje ensamblador para las arquitecturas **MIPS (usando MARS)** y **RISC-V**:

- **Suma de un arreglo de datos:** Dado un arreglo de `N` enteros, calcula la suma de todos sus elementos.
- **Búsqueda del valor máximo en un arreglo:** Recorre un arreglo de `N` enteros y devuelve el valor máximo encontrado.
- **Factorial de un número (N!):** Calcula el factorial de un número `N` utilizando un bucle iterativo.

Además, se incluyen versiones en **Python** para visualizar estos algoritmos en un código de alto nivel, facilitando su comprensión y comparación con el ensamblador.

---

## Tecnologías y herramientas

- **MIPS**: Ensamblador para MIPS, compatible con el simulador [MARS](https://dpetersanderson.github.io/download.html)
- **RISC-V**: Código en ensamblador para arquitectura RISC-V (se especifica en cada carpeta o archivo)
- **Python**: Implementaciones de los mismos algoritmos en código de alto nivel para facilitar el aprendizaje y pruebas rápidas.

---

## Cómo usar

### Para ejecutar los algoritmos en MIPS

1. Descargar e instalar el simulador MARS desde:  
   [https://dpetersanderson.github.io/download.html](https://dpetersanderson.github.io/download.html)

2. Abrir el archivo `.asm` correspondiente en MARS.

3. Ejecutar el programa y seguir las instrucciones en consola.

### Para ejecutar los algoritmos en Python

1. Asegurarse de tener Python instalado (versión 3.x recomendada).

2. Ejecutar los scripts `.py` correspondientes usando el intérprete de Python, por ejemplo:  
   ```bash
   python suma_arreglo.py
