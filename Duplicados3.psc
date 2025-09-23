// ---- Función auxiliar para validar si una cadena es un número entero ----
Funcion resultado <- EsEntero(txt Por Valor)
    Definir i Como Entero
    Definir valido Como Logico
    valido <- Verdadero
    
    Si Longitud(txt) = 0 Entonces
        valido <- Falso
    Sino
        Para i <- 1 Hasta Longitud(txt) Hacer
            Si Subcadena(txt,i,i) < "0" O Subcadena(txt,i,i) > "9" Entonces
                valido <- Falso
            FinSi
        FinPara
    FinSi
    
    Si valido Entonces
        resultado <- 1
    Sino
        resultado <- 0
    FinSi
FinFuncion

// ---- Proceso principal ----
Proceso Duplicados
    Definir n, i, j, k, contador, valido Como Entero
    Definir entrada Como Cadena
    Definir arr Como Entero
    Definir yaMostrado Como Logico   // <<--- Declarada aquí, solo una vez
	
    // Leer tamaño del arreglo con validación
    Repetir
        Escribir "Ingrese el tamaño del arreglo (entero > 0):"
        Leer entrada
        valido <- EsEntero(entrada)
        Si valido = 1 Entonces
            n <- ConvertirANumero(entrada)
        Sino
            n <- 0
            Escribir "Entrada inválida. Intente de nuevo."
        FinSi
    Hasta Que n > 0
	
    Dimension arr[n]
	
    // Leer los elementos del arreglo
    Para i <- 1 Hasta n Hacer
        Repetir
            Escribir "Ingrese el elemento ", i, ":"
            Leer entrada
            valido <- EsEntero(entrada)
            Si valido = 1 Entonces
                arr[i] <- ConvertirANumero(entrada)
            Sino
                Escribir "Entrada inválida. Debe ser un número entero."
            FinSi
        Hasta Que valido = 1
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
		
        // Si aparece exactamente 2 veces, verificar si ya se mostró antes
        Si contador = 2 Entonces
            yaMostrado <- Falso   // reiniciar bandera
            Si i > 1 Entonces
                Para k <- 1 Hasta i-1 Hacer
                    Si arr[i] = arr[k] Entonces
                        yaMostrado <- Verdadero
                    FinSi
                FinPara
            FinSi
            
            Si No yaMostrado Entonces
                Escribir arr[i]
            FinSi
        FinSi
    FinPara
FinProceso
