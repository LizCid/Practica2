Proceso CalcularEdad
    Definir fechaNacimiento, fechaHoy Como Cadena
    Definir diaNac, mesNac, a�oNac Como Entero
    Definir diaHoy, mesHoy, a�oHoy Como Entero
    Definir edad, valido Como Entero
	
    // --- Leer y validar la fecha de nacimiento ---
    Repetir
        Escribir "Ingrese fecha de nacimiento (DD-MM-AAAA):"
        Leer fechaNacimiento
		
        // Extraer d�a, mes y a�o usando Subcadena
        diaNac <- ConvertirANumero(Subcadena(fechaNacimiento,1,2))
        mesNac <- ConvertirANumero(Subcadena(fechaNacimiento,4,5))
        a�oNac <- ConvertirANumero(Subcadena(fechaNacimiento,7,10))
		
        valido <- 1   // Se asume v�lido al inicio
		
        // Validar a�o
        Si a�oNac < 1900 Entonces
            Escribir "A�o inv�lido. Debe ser mayor a 1900."
            valido <- 0
        FinSi
		
        // Validar rango de mes y d�a
        Si (mesNac < 1 O mesNac > 12) O (diaNac < 1 O diaNac > 31) Entonces
            Escribir "Fecha inv�lida."
            valido <- 0
        FinSi
		
        // Rechazar el 29 de febrero (simplificaci�n del programa)
        Si (mesNac = 2 Y diaNac = 29) Entonces
            Escribir "El 29 de febrero no es v�lido en este programa."
            valido <- 0
        FinSi
    Hasta Que valido = 1
	
    // --- Leer y validar la fecha actual ---
    Repetir
        Escribir "Ingrese la fecha de hoy (DD-MM-AAAA):"
        Leer fechaHoy
		
        // Extraer d�a, mes y a�o de la fecha actual
        diaHoy <- ConvertirANumero(Subcadena(fechaHoy,1,2))
        mesHoy <- ConvertirANumero(Subcadena(fechaHoy,4,5))
        a�oHoy <- ConvertirANumero(Subcadena(fechaHoy,7,10))
		
        valido <- 1
		
        // Validar rango de mes y d�a
        Si (mesHoy < 1 O mesHoy > 12) O (diaHoy < 1 O diaHoy > 31) Entonces
            Escribir "Fecha inv�lida."
            valido <- 0
        FinSi
		
        // Rechazar 29 de febrero
        Si (mesHoy = 2 Y diaHoy = 29) Entonces
            Escribir "El 29 de febrero no es v�lido en este programa."
            valido <- 0
        FinSi
    Hasta Que valido = 1
	
    // --- Calcular edad ---
    edad <- a�oHoy - a�oNac
	
    // Si a�n no cumpli� a�os este a�o, se resta 1
    Si (mesHoy < mesNac) O (mesHoy = mesNac Y diaHoy < diaNac) Entonces
        edad <- edad - 1
    FinSi
	
    // --- Mostrar resultado ---
    Escribir "Edad calculada: ", edad, " a�os"
FinProceso
