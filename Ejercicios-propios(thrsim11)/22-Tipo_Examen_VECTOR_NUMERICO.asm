; 22-Tipo_Examen_VECTOR_NUMERICO
; Archivo: Arquitectura de computadoras - Parcial_02.jpg
; Se tiene un vector almacenado en memoria, formado por 256 elementos numericos signados (de -128 a 127), del que se conocen la cantidad
; de elementos (almacenada en CANT) y la direccion de memoria en la que se encuentran el primer elemento (almacenada en PUNT).
; Se requiere un programa que determine:
; - La cantidad de elementos del vector que sean a la vez negatovos y multiplos de cuatro.
; - La cantidad de elementos nulos.
; - Las direciones de memoria en que se encuentran los elementos nulos


RAM			EQU		$0000
ROM			EQU		$8000
DIR_VECTOR		EQU		$0030
DIR_VECTOR_NULOS	EQU		$0060
CANT			EQU		20

			ORG		RAM
PUNT			RMB		2
PUNT_NULOS		RMB		2
CANT_NEG_MULT4		RMB		1
CANT_NULOS		RMB		1

			ORG		ROM
			LDX		PUNT
			LDY		PUNT_NULOS		
			CLR		CANT_NEG_MULT4		
			CLR		CANT_NULOS		
			LDAB		#CANT
			TSTB
			BEQ		FIN
BUCLE			LDAA		0,X
			BEQ		ES_CERO			; ?Z=1
			BGE		SIG			; N(+)V=0 (ES POSITIVO)
			BITA		#%0011
			BEQ		ES_NEG_MULT4
SIG			INX
			DECB
			BNE		BUCLE
FIN			BRA		FIN


ES_CERO			INC		CANT_NULOS	
			STX		0,Y
			INY
			INY
			BRA		SIG

ES_NEG_MULT4		INC		CANT_NEG_MULT4		
			BRA		SIG



; INICIALIZACION VECTOR
			ORG		PUNT			
			DW		DIR_VECTOR
			ORG		PUNT_NULOS		
			DW		DIR_VECTOR_NULOS	
			ORG		DIR_VECTOR
			DB		3,-8,0,12,15,-24,0,24,27,-40,33,0,39,-56,45,0,-68,54,-76,0
