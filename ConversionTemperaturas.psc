Proceso ConversionTemperaturas
    // Variables
    Definir n, i, j Como Entero              // n = cantidad de temperaturas, i = contador, j = índice para validar la cadena
    Definir celsius, fahrenheit Como Real    // valores de temperaturas
    Definir entrada Como Cadena              // se usa para leer la temperatura como texto
    Definir esNumero Como Logico             // bandera para validar si la entrada es un número, variable booleana
    
    // Preguntar al usuario cuántas temperaturas desea convertir
    Escribir "¿Cuántas temperaturas deseas convertir?"
    Leer n
    
    // Bucle principal: repetir la conversión n veces
    Para i <- 1 Hasta n Con Paso 1 Hacer
        
        // Validación de entrada 
     
        Repetir
            Escribir "Introduce la temperatura en Celsius (dato ", i, "):"
            Leer entrada
            esNumero <- Verdadero
            
            // Validar carácter por carácter
            Para j <- 1 Hasta Longitud(entrada) Hacer
                // Se aceptan números, punto decimal y signo negativo
                Si No (Subcadena(entrada,j,j) >= "0" Y Subcadena(entrada,j,j) <= "9" O Subcadena(entrada,j,j)="." O Subcadena(entrada,j,j)="-") Entonces
                    esNumero <- Falso
                FinSi
            FinPara
            
            // Si no es válido, avisar al usuario
            Si No esNumero Entonces
                Escribir "Error: el valor ingresado no es un número, intenta de nuevo."
            FinSi
        Hasta Que esNumero
        
        
        // Conversión de temperatura
    
        celsius <- ConvertirANumero(entrada)              // convertir el texto validado a número
        fahrenheit <- (celsius * 9 / 5) + 32              // aplicar la fórmula de conversión
        
        
        // Resultado
        
        Escribir celsius, " °C = ", fahrenheit, " °F"
    FinPara
FinProceso
