// ---- Función para verificar si una cadena es un número entero ----
Funcion resultado <- EsEntero(txt Por Valor)
    Definir i Como Entero
    Definir valido Como Logico
    valido <- Verdadero
    
    // Si el texto está vacío -> no es número
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
Proceso DispensadoraBilletes
    Definir i, cantidad, valido, importe Como Entero
    Definir entrada Como Cadena
    Dimension denominaciones[6]
    Dimension inventario[6]
    Dimension entregar[6]
	
    // --- Inicializar denominaciones ---
    denominaciones[1] <- 1000
    denominaciones[2] <- 500
    denominaciones[3] <- 200
    denominaciones[4] <- 100
    denominaciones[5] <- 50
    denominaciones[6] <- 20
	
    // --- Inicializar inventario y vector de entrega ---
    Para i <- 1 Hasta 6 Hacer
        inventario[i] <- 10   // 10 billetes de cada tipo
        entregar[i] <- 0
    FinPara
	
    // --- Solicitar importe con validación ---
    Repetir
        Escribir "Ingrese el importe a retirar:"
        Leer entrada
        valido <- EsEntero(entrada)
        Si valido = 1 Entonces
            importe <- ConvertirANumero(entrada)
        Sino
            importe <- -1
            Escribir "Entrada inválida. Debe ingresar un número entero."
        FinSi
    Hasta Que importe >= 0
	
    // --- Validación de múltiplo de 10 ---
    Si (importe <= 0) O (importe MOD 10 <> 0) Entonces
        Escribir "El importe debe ser positivo y múltiplo de 10."
    Sino
        // --- Algoritmo greedy: usar billetes grandes primero ---
        Para i <- 1 Hasta 6 Hacer
            cantidad <- Trunc(importe / denominaciones[i])
            Si cantidad > inventario[i] Entonces
                cantidad <- inventario[i]
            FinSi
            
            entregar[i] <- cantidad
            importe <- importe - cantidad * denominaciones[i]
        FinPara
		
        // --- Verificar si se cubrió todo el importe ---
        Si importe > 0 Entonces
            Escribir "No hay billetes suficientes para dispensar esa cantidad."
        Sino
            Escribir "Billetes entregados:"
            Para i <- 1 Hasta 6 Hacer
                Si entregar[i] > 0 Entonces
                    Escribir entregar[i], " billete(s) de ", denominaciones[i]
                    inventario[i] <- inventario[i] - entregar[i]
                FinSi
            FinPara
        FinSi
    FinSi	
FinProceso
