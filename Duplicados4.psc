Algoritmo DuplicadosFijos
    Definir i, j, k, contador, m, temp Como Entero
    Definir yaMostrado Como Logico
	
    // Declarar arreglos
    Dimension arr[8]
    Dimension res[8]
	
    // Arreglo fijo
    arr[1] <- 4
    arr[2] <- 3
    arr[3] <- 2
    arr[4] <- 7
    arr[5] <- 8
    arr[6] <- 2
    arr[7] <- 3
    arr[8] <- 1
	
    // Tamaño del arreglo
    n <- 8
    m <- 0  // contador de duplicados encontrados
	Escribir "El arreglo inicial es [4,3,2,7,8,3,3,1]"
    // Buscar duplicados
    Para i <- 1 Hasta n Hacer
        contador <- 0
		
        Para j <- 1 Hasta n Hacer
            Si arr[i] = arr[j] Entonces
                contador <- contador + 1
            FinSi
        FinPara
		
        Si contador = 2 Entonces
            yaMostrado <- Falso
            Si m > 0 Entonces     // <--- validación agregada
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
	
    // Ordenar resultados ascendente
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
	
    // Imprimir resultado
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
