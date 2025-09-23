Proceso CadenaInversa
    Definir texto, inverso Como Cadena
    Definir i Como Entero
    
    // --- Entrada de datos ---
    Escribir "Ingrese una palabra: "
    Leer texto
    
    // --- Construcci�n de la cadena inversa ---
    inverso <- ""   // Se inicializa vac�o
    Para i <- Longitud(texto) Hasta 1 Con Paso -1 Hacer
        // Se va tomando cada letra desde el final hasta el inicio
        inverso <- inverso + Subcadena(texto,i,i)
    FinPara
    
    // --- Mostrar resultado ---
    Escribir "Cadena invertida: ", inverso
    
    // --- Verificar si es pal�ndromo ---
    Si texto = inverso Entonces
        Escribir "Es pal�ndromo"
    Sino
        Escribir "No es pal�ndromo"
    FinSi
FinProceso

