// --- Funci�n auxiliar para validar si una cadena es un n�mero entero ---
Funci�n resultado <- EsEntero(txt Por Valor)
Definir i Como Entero
Definir valido Como L�gico
valido <- Verdadero

// Si la cadena est� vac�a ? no es un n�mero
Si Longitud(txt)=0 Entonces
	valido <- Falso
SiNo
	// Revisar car�cter por car�cter
	// Si alguno no es d�gito entre '0' y '9', no es entero
	Para i<-1 Hasta Longitud(txt) Hacer
		Si Subcadena(txt,i,i)<'0' O Subcadena(txt,i,i)>'9' Entonces
			valido <- Falso
		FinSi
	FinPara
FinSi

// Retornar 1 si es entero v�lido, 0 si no lo es
Si valido Entonces
	resultado <- 1
SiNo
	resultado <- 0
FinSi
FinFunci�n

// --- Proceso principal ---
Algoritmo Duplicados
	// Declaraci�n de variables
	Definir n, i, j, k, contador, valido Como Entero
	Definir entrada Como Cadena
	Definir arr Como Entero
	Definir yaMostrado Como L�gico
	
	// --- Leer tama�o del arreglo con validaci�n ---
	Repetir 
		Escribir 'Ingrese el tama�o del arreglo (entero > 0):'
		Leer entrada
		valido <- EsEntero(entrada) // Verifica si la entrada es un entero
		Si valido=1 Entonces
			n <- ConvertirANumero(entrada) // Se convierte a n�mero
		SiNo
			n <- 0
			Escribir 'Entrada inv�lida. Intente de nuevo.'
		FinSi
	Hasta Que n>0
	
	// Crear arreglo de tama�o n
	Dimensionar arr(n)
	
	// --- Leer los elementos del arreglo ---
	Para i<-1 Hasta n Hacer
		Repetir
			Escribir 'Ingrese el elemento ', i, ':'
			Leer entrada
			valido <- EsEntero(entrada) // Validar si es n�mero
			Si valido=1 Entonces
				arr[i] <- ConvertirANumero(entrada)
			SiNo
				Escribir 'Entrada inv�lida. Debe ser un n�mero entero.'
			FinSi
		Hasta Que valido=1
	FinPara
	
	// --- Buscar duplicados exactos ---
	Escribir 'N�meros que se repiten exactamente dos veces:'
	
	// Recorrer cada elemento del arreglo
	Para i<-1 Hasta n Hacer
		contador <- 0
		
		// Contar cu�ntas veces aparece arr[i]
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
			
			// Si no ha sido mostrado a�n, se escribe
			Si NO yaMostrado Entonces
				Escribir arr[i]
			FinSi
		FinSi
	FinPara
FinAlgoritmo


