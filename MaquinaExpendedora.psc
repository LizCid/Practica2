// -----------------------------
// Función: EsEntero
// Verifica si una cadena es un número entero
// -----------------------------
Funcion resultado <- EsEntero(txt Por Valor)
    Definir i Como Entero
    Definir valido Como Logico
    valido <- Verdadero
    
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

// -----------------------------
// Función: BuscarPrecio
// Busca el precio de un producto por su código
// -----------------------------
Funcion precio <- BuscarPrecio(codigo Por Valor, productos, precios)
    Definir i Como Entero
    precio <- 0
    Para i <- 1 Hasta 4 Hacer  // aquí recorremos los 4 productos
        Si codigo = productos[i] Entonces
            precio <- precios[i]
        FinSi
    FinPara
FinFuncion

// -----------------------------
// Función: ProcesarComando
// Maneja los comandos especiales: PARAR y RETIRAR
// -----------------------------
Funcion resultado <- ProcesarComando(comando Por Valor, importe Por Referencia)
    Definir resultado Como Entero
    resultado <- 0 // 0 = nada especial, 1 = terminar compra, 2 = apagar máquina
    
    Si comando = "RETIRAR" Entonces
        Si importe > 0 Entonces
            Escribir "Operación cancelada. Se devuelven $", importe
            importe <- 0
        Sino
            Escribir "No hay importe a devolver."
        FinSi
        resultado <- 1
    SiNo
        Si comando = "PARAR" Entonces
            resultado <- 2
        FinSi
    FinSi
FinFuncion


// -----------------------------
// PROCESO PRINCIPAL
// -----------------------------
Proceso MaquinaExpendedora
    Definir entrada, entradaUp Como Cadena
    Definir importe, moneda, precio, i Como Entero
    Definir terminar, compraFinalizada, comandoRes Como Entero
	
    Dimension productos[4]
    Dimension precios[4]
	
    // Inicializar productos y precios 
    productos[1] <- "A1"
    precios[1] <- 15
    productos[2] <- "B2"
    precios[2] <- 20
    productos[3] <- "C3"
    precios[3] <- 10
    productos[4] <- "D4"
    precios[4] <- 18
	
    terminar <- 0
	
    Escribir "Bienvenido a la Máquina Expendedora"
    Escribir "Productos disponibles:"
    Escribir " A1 = Papas ($15)"
    Escribir " B2 = Refresco ($20)"
    Escribir " C3 = Galletas ($10)"
    Escribir " D4 = Chocolate ($18)"
    Escribir "Comandos: Retirar, Parar"
    Escribir ""
	
    Repetir   
        importe <- 0
        compraFinalizada <- 0
        Escribir "Inserte monedas (1,2,5,10,20) o código de producto (ej. A1)."
        
        Repetir   
            Leer entrada
            entradaUp <- Mayusculas(entrada)
            
            // Procesar comandos especiales
            comandoRes <- ProcesarComando(entradaUp, importe)
            Si comandoRes = 1 Entonces
                compraFinalizada <- 1   // terminó compra actual
            SiNo
                Si comandoRes = 2 Entonces
                    terminar <- 1       // apagar máquina
                    compraFinalizada <- 1
                SiNo
                    // Si es número = moneda
                    Si EsEntero(entrada) = 1 Entonces
                        moneda <- ConvertirANumero(entrada)
                        Si moneda = 1 O moneda = 2 O moneda = 5 O moneda = 10 O moneda = 20 Entonces
                            importe <- importe + moneda
                            Escribir "Importe actual: $", importe
                        Sino
                            Escribir "Moneda no aceptada."
                        FinSi
                    SiNo
                        // Buscar precio del producto
                        precio <- BuscarPrecio(entradaUp, productos, precios)
                        Si precio > 0 Entonces
                            Si importe >= precio Entonces
                                Escribir "Producto ", entradaUp, " dispensado."
                                Escribir "Cambio: $", importe - precio
                                importe <- 0
                                compraFinalizada <- 1
                            Sino
                                Escribir "Saldo insuficiente. Precio: $", precio, ", saldo: $", importe
                            FinSi
                        SiNo
                            Escribir "Comando no reconocido."
                        FinSi
                    FinSi
                FinSi
            FinSi
        Hasta Que compraFinalizada = 1
		
    Hasta Que terminar = 1
	
    Escribir "Máquina apagada. Gracias."
FinProceso
