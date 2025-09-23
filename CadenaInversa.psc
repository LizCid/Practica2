Proceso CadenaInversa
    Definir texto, inverso Como Cadena
    Definir i Como Entero
    
    // --- Entrada de datos ---
    Escribir "Ingrese una palabra: "
    Leer texto
    
    // --- Construcción de la cadena inversa ---
    inverso <- ""   // Se inicializa vacío
    Para i <- Longitud(texto) Hasta 1 Con Paso -1 Hacer
        // Se va tomando cada letra desde el final hasta el inicio
        inverso <- inverso + Subcadena(texto,i,i)
    FinPara
    
    // --- Mostrar resultado ---
    Escribir "Cadena invertida: ", inverso
    
    // --- Verificar si es palíndromo ---
    Si texto = inverso Entonces
        Escribir "Es palíndromo"
    Sino
        Escribir "No es palíndromo"
    FinSi
FinProceso

