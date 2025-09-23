Proceso ConversionTemperaturas
    // Variables
    Definir n, i, j Como Entero              // n = cantidad de temperaturas, i = contador, j = �ndice para validar la cadena
    Definir celsius, fahrenheit Como Real    // valores de temperaturas
    Definir entrada Como Cadena              // se usa para leer la temperatura como texto
    Definir esNumero Como Logico             // bandera para validar si la entrada es un n�mero, variable booleana
    
    // Preguntar al usuario cu�ntas temperaturas desea convertir
    Escribir "�Cu�ntas temperaturas deseas convertir?"
    Leer n
    
    // Bucle principal: repetir la conversi�n n veces
    Para i <- 1 Hasta n Con Paso 1 Hacer
        
        // Validaci�n de entrada 
     
        Repetir
            Escribir "Introduce la temperatura en Celsius (dato ", i, "):"
            Leer entrada
            esNumero <- Verdadero
            
            // Validar car�cter por car�cter
            Para j <- 1 Hasta Longitud(entrada) Hacer
                // Se aceptan n�meros, punto decimal y signo negativo
                Si No (Subcadena(entrada,j,j) >= "0" Y Subcadena(entrada,j,j) <= "9" O Subcadena(entrada,j,j)="." O Subcadena(entrada,j,j)="-") Entonces
                    esNumero <- Falso
                FinSi
            FinPara
            
            // Si no es v�lido, avisar al usuario
            Si No esNumero Entonces
                Escribir "Error: el valor ingresado no es un n�mero, intenta de nuevo."
            FinSi
        Hasta Que esNumero
        
        
        // Conversi�n de temperatura
    
        celsius <- ConvertirANumero(entrada)              // convertir el texto validado a n�mero
        fahrenheit <- (celsius * 9 / 5) + 32              // aplicar la f�rmula de conversi�n
        
        
        // Resultado
        
        Escribir celsius, " �C = ", fahrenheit, " �F"
    FinPara
FinProceso
