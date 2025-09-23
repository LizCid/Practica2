Proceso ListaDeCadenasInversas
    Definir n, i, j Como Entero
    Definir palabra, inverso Como Cadena
    Definir lista Como Cadena
    
    // --- Leer cu�ntas palabras se van a ingresar ---
    Escribir "�Cu�ntas palabras quiere ingresar?"
    Leer n
    
    Dimension lista[n]
    
    // --- Leer cada palabra ---
    Para i <- 1 Hasta n Hacer
        Escribir "Ingrese la palabra ", i, ": "
        Leer lista[i]
    FinPara
    
    // --- Procesar cada palabra (invertirla) ---
    Escribir ""
    Escribir "Resultados:"
    Para i <- 1 Hasta n Hacer
        palabra <- lista[i]
        inverso <- ""
        
        Para j <- Longitud(palabra) Hasta 1 Con Paso -1 Hacer
            inverso <- inverso + Subcadena(palabra, j, j)
        FinPara
        
        Escribir "Palabra original: ", palabra, "  ->  Inversa: ", inverso
        
        // Verificar pal�ndromo
        Si palabra = inverso Entonces
            Escribir "   (Es pal�ndromo)"
        FinSi
    FinPara
FinProceso
