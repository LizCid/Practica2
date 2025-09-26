// --- Funci�n auxiliar para validar si una cadena es un n�mero entero ---
Funci�n resultado <- EsEntero(txt Por Valor)
Definir i Como Entero
Definir valido Como L�gico
valido <- Verdadero

// Si la cadena est� vac�a ? no es un n�mero
Si Longitud(txt) = 0 Entonces
	valido <- Falso
SiNo
	// Revisar car�cter por car�cter
	Para i <- 1 Hasta Longitud(txt) Hacer
		Si Subcadena(txt,i,i) < "0" O Subcadena(txt,i,i) > "9" Entonces
			valido <- Falso
		FinSi
	FinPara
FinSi

// Retornar 1 si es v�lido, 0 si no
Si valido Entonces
	resultado <- 1
SiNo
	resultado <- 0
FinSi
FinFunci�n


// --- Algoritmo principal ---
Algoritmo DuplicadosFinal
    Definir i, j, k, contador, m, temp, n Como Entero
    Definir yaMostrado Como L�gico
    Definir entrada Como Cadena
	
    // --- Leer tama�o del arreglo con validaci�n ---
    Repetir
        Escribir "�Cu�ntos elementos tendr� el arreglo?"
        Leer entrada
        Si EsEntero(entrada) = 1 Entonces
            n <- ConvertirANumero(entrada)
        SiNo
            Escribir "Entrada inv�lida. Debe ser un n�mero entero positivo."
            n <- 0
        FinSi
    Hasta Que n > 0
	
    // Declarar arreglos din�micos
    Dimension arr[n]
    Dimension res[n]
	
    // --- Leer valores del arreglo con validaci�n ---
    Para i <- 1 Hasta n Hacer
        Repetir
            Escribir "Ingrese el valor ", i, ":"
            Leer entrada
            Si EsEntero(entrada) = 1 Entonces
                arr[i] <- ConvertirANumero(entrada)
            SiNo
                Escribir "Entrada inv�lida. Debe ser un n�mero entero."
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
