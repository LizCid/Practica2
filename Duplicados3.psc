// --- Función auxiliar para validar si una cadena es un número entero ---
Función resultado <- EsEntero(txt Por Valor)
Definir i Como Entero
Definir valido Como Lógico
valido <- Verdadero

// Si la cadena está vacía ? no es un número
Si Longitud(txt)=0 Entonces
	valido <- Falso
SiNo
	// Revisar carácter por carácter
	// Si alguno no es dígito entre '0' y '9', no es entero
	Para i<-1 Hasta Longitud(txt) Hacer
		Si Subcadena(txt,i,i)<'0' O Subcadena(txt,i,i)>'9' Entonces
			valido <- Falso
		FinSi
	FinPara
FinSi

// Retornar 1 si es entero válido, 0 si no lo es
Si valido Entonces
	resultado <- 1
SiNo
	resultado <- 0
FinSi
FinFunción

// --- Proceso principal ---
Algoritmo Duplicados
	// Declaración de variables
	Definir n, i, j, k, contador, valido Como Entero
	Definir entrada Como Cadena
	Definir arr Como Entero
	Definir yaMostrado Como Lógico
	
	// --- Leer tamaño del arreglo con validación ---
	Repetir 
		Escribir 'Ingrese el tamaño del arreglo (entero > 0):'
		Leer entrada
		valido <- EsEntero(entrada) // Verifica si la entrada es un entero
		Si valido=1 Entonces
			n <- ConvertirANumero(entrada) // Se convierte a número
		SiNo
			n <- 0
			Escribir 'Entrada inválida. Intente de nuevo.'
		FinSi
	Hasta Que n>0
	
	// Crear arreglo de tamaño n
	Dimensionar arr(n)
	
	// --- Leer los elementos del arreglo ---
	Para i<-1 Hasta n Hacer
		Repetir
			Escribir 'Ingrese el elemento ', i, ':'
			Leer entrada
			valido <- EsEntero(entrada) // Validar si es número
			Si valido=1 Entonces
				arr[i] <- ConvertirANumero(entrada)
			SiNo
				Escribir 'Entrada inválida. Debe ser un número entero.'
			FinSi
		Hasta Que valido=1
	FinPara
	
	// --- Buscar duplicados exactos ---
	Escribir 'Números que se repiten exactamente dos veces:'
	
	// Recorrer cada elemento del arreglo
	Para i<-1 Hasta n Hacer
		contador <- 0
		
		// Contar cuántas veces aparece arr[i]
		Para j<-1 Hasta n Hacer
			Si arr[i]=arr[j] Entonces
				contador <- contador+1
			FinSi
		FinPara
		
		// Si aparece exactamente 2 veces, comprobar si ya fue mostrado
		Si contador=2 Entonces
			yaMostrado <- Falso
			
			// Verificar si arr[i] ya fue escrito antes
			Si i>1 Entonces
				Para k<-1 Hasta i-1 Hacer
					Si arr[i]=arr[k] Entonces
						yaMostrado <- Verdadero
					FinSi
				FinPara
			FinSi
			
			// Si no ha sido mostrado aún, se escribe
			Si NO yaMostrado Entonces
				Escribir arr[i]
			FinSi
		FinSi
	FinPara
FinAlgoritmo


