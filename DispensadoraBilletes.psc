Proceso DispensadoraBilletes
    Definir importe, i, cantidad Como Entero
    Dimension denominaciones[6]  // Arreglo de valores de billetes
    Dimension inventario[6]      // Cuántos billetes hay de cada tipo
    Dimension entregar[6]        // Cuántos billetes se deben entregar
	
    // --- Inicializar denominaciones ---
    denominaciones[1] <- 1000
    denominaciones[2] <- 500
    denominaciones[3] <- 200
    denominaciones[4] <- 100
    denominaciones[5] <- 50
    denominaciones[6] <- 20
	
    // --- Inicializar inventario y vector de entrega ---
    Para i <- 1 Hasta 6 Hacer
        inventario[i] <- 10   // Supongamos que hay 10 billetes de cada tipo
        entregar[i] <- 0
    FinPara
	
    // --- Solicitar importe ---
    Escribir "Ingrese el importe a retirar:"
    Leer importe
	
    // --- Validación de importe ---
    Si (importe <= 0) O (importe MOD 10 <> 0) Entonces
        Escribir "El importe debe ser un número positivo y múltiplo de 10."
    Sino
        // --- Algoritmo greedy: usar billetes grandes primero ---
        Para i <- 1 Hasta 6 Hacer
            // Se calcula cuántos billetes de esta denominación se pueden usar
            cantidad <- Trunc(importe / denominaciones[i])
            
            // No se puede usar más de los que hay en inventario
            Si cantidad > inventario[i] Entonces
                cantidad <- inventario[i]
            FinSi
            
            // Guardar cuántos se entregan y restar al importe
            entregar[i] <- cantidad
            importe <- importe - cantidad * denominaciones[i]
        FinPara
		
        // --- Validar si se cubrió todo el importe ---
        Si importe > 0 Entonces
            Escribir "No hay billetes suficientes para dispensar esa cantidad."
        Sino
            Escribir "Billetes entregados:"
            Para i <- 1 Hasta 6 Hacer
                Si entregar[i] > 0 Entonces
                    Escribir entregar[i], " billete(s) de ", denominaciones[i]
                    inventario[i] <- inventario[i] - entregar[i] // Se descuenta del cajero
                FinSi
            FinPara
        FinSi
    FinSi	
FinProceso
