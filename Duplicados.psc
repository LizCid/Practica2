//Proceso sencillo
//Sin validacón de que es un número
Proceso Duplicados
    Definir n, i, j, contador Como Entero
    Definir arr Como Entero
	
    // Leer tamaño del arreglo
    Escribir "Ingrese el tamaño del arreglo:"
    Leer n
    Dimension arr[n]
	
    // Leer elementos directamente (sin validación)
    Para i <- 1 Hasta n Hacer
        Escribir "Ingrese el elemento ", i, ":"
        Leer arr[i]
    FinPara
	
    // Buscar duplicados exactos
    Escribir "Números que se repiten exactamente dos veces:"
    Para i <- 1 Hasta n Hacer
        contador <- 0
        // Contar cuántas veces aparece arr[i]
        Para j <- 1 Hasta n Hacer
            Si arr[i] = arr[j] Entonces
                contador <- contador + 1
            FinSi
        FinPara
		
        // Mostrar si se repite exactamente 2 veces
        // y solo la primera vez que aparece
        Si contador = 2 Y (i = 1 O arr[i] <> arr[i-1]) Entonces
            Escribir arr[i]
        FinSi
    FinPara
FinProceso
