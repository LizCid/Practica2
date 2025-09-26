// --- Función auxiliar para validar si una cadena es un número entero ---
Función resultado <- EsEntero(txt Por Valor)
Definir i Como Entero
Definir valido Como Lógico
valido <- Verdadero

// Si la cadena está vacía ? no es un número
Si Longitud(txt) = 0 Entonces
	valido <- Falso
SiNo
	// Revisar carácter por carácter
	Para i <- 1 Hasta Longitud(txt) Hacer
		Si Subcadena(txt,i,i) < "0" O Subcadena(txt,i,i) > "9" Entonces
			valido <- Falso
		FinSi
	FinPara
FinSi

// Retornar 1 si es válido, 0 si no
Si valido Entonces
	resultado <- 1
SiNo
	resultado <- 0
FinSi
FinFunción


// --- Algoritmo principal ---
Algoritmo DuplicadosFinal
    Definir i, j, k, contador, m, temp, n Como Entero
    Definir yaMostrado Como Lógico
    Definir entrada Como Cadena
	
    // --- Leer tamaño del arreglo con validación ---
    Repetir
        Escribir "¿Cuántos elementos tendrá el arreglo?"
        Leer entrada
        Si EsEntero(entrada) = 1 Entonces
            n <- ConvertirANumero(entrada)
        SiNo
            Escribir "Entrada inválida. Debe ser un número entero positivo."
            n <- 0
        FinSi
    Hasta Que n > 0
	
    // Declarar arreglos dinámicos
    Dimension arr[n]
    Dimension res[n]
	
    // --- Leer valores del arreglo con validación ---
    Para i <- 1 Hasta n Hacer
        Repetir
            Escribir "Ingrese el valor ", i, ":"
            Leer entrada
            Si EsEntero(entrada) = 1 Entonces
                arr[i] <- ConvertirANumero(entrada)
            SiNo
                Escribir "Entrada inválida. Debe ser un número entero."
            FinSi
        Hasta Que EsEntero(entrada) = 1
    FinPara
	
    m <- 0  // contador de duplicados encontrados
	
    // --- Buscar duplicados (exactamente dos veces) ---
    Para i <- 1 Hasta n Hacer
        contador <- 0
        Para j <- 1 Hasta n Hacer
            Si arr[i] = arr[j] Entonces
                contador <- contador + 1
            FinSi
        FinPara
		
        Si contador = 2 Entonces
            yaMostrado <- Falso
            Si m > 0 Entonces
                Para k <- 1 Hasta m Hacer
                    Si res[k] = arr[i] Entonces
                        yaMostrado <- Verdadero
                    FinSi
                FinPara
            FinSi
			
            Si NO yaMostrado Entonces
                m <- m + 1
                res[m] <- arr[i]
            FinSi
        FinSi
    FinPara
	
    // --- Ordenar resultados ascendente ---
    Si m > 1 Entonces
        Para i <- 1 Hasta m-1 Hacer
            Para j <- i+1 Hasta m Hacer
                Si res[i] > res[j] Entonces
                    temp <- res[i]
                    res[i] <- res[j]
                    res[j] <- temp
                FinSi
            FinPara
        FinPara
    FinSi
	
    // --- Imprimir resultado ---
    Si m = 0 Entonces
        Escribir "[]"
    SiNo
        Definir salida Como Cadena
        salida <- "El resultado es = ["
        Para i <- 1 Hasta m Hacer
            salida <- salida + ConvertirATexto(res[i])
            Si i < m Entonces
                salida <- salida + ","
            FinSi
        FinPara
        salida <- salida + "]"
        Escribir salida
    FinSi
FinAlgoritmo
