//Proceso sencillo
//Sin validac�n de que es un n�mero
Proceso Duplicados
    Definir n, i, j, contador Como Entero
    Definir arr Como Entero
	
    // Leer tama�o del arreglo
    Escribir "Ingrese el tama�o del arreglo:"
    Leer n
    Dimension arr[n]
	
    // Leer elementos directamente (sin validaci�n)
    Para i <- 1 Hasta n Hacer
        Escribir "Ingrese el elemento ", i, ":"
        Leer arr[i]
    FinPara
	
    // Buscar duplicados exactos
    Escribir "N�meros que se repiten exactamente dos veces:"
    Para i <- 1 Hasta n Hacer
        contador <- 0
        // Contar cu�ntas veces aparece arr[i]
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
