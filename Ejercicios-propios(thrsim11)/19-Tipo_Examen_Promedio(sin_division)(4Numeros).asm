; 19-Tipo_Examen_Promedio(sin_division)
; Archivo: Arquitectura de computadoras - Parcial_01.jpg
; Se requiere un programa que permita calcular el promedio entre cuatro numeros de 8 bits sin signo sin usar la instruccion de division.
; Considerar datos las direcciones de memoria (consecutivas entre si) en que se encuentran almacenados los numeros.

; SE PUEDE RESOLVER DE ESTA FORMA (CORRIENDO BITS A LA IZQ A LA SUMA DE LOS NUMEROS, PORQUE LA CANT DE NUMEROS PARA CALCULAR EL PROMEDIO
; ES DE BASE 2 (2^2=4). (SE PODRIA HACER SI SON 2,4,8,16 ETC NUMEROS)


RAM		EQU		$0000
ROM		EQU		$8000
DIR_1ERNUM	EQU		$0040
CANT		EQU		4

		ORG		RAM
DIR_NUM		RMB		2			; DIR 1ER NUM
SUMA		RMB		2
;PROMEDIO	RMB		2
PROMEDIO	RMB		1

		ORG		ROM
		LDX		DIR_NUM
		CLRA
		CLR		SUMA
		CLR		SUMA+1
		LDAB		#CANT
BUCLE_SUMAS	ADDA		0,X
		BCS		HAY_CARRY
SIG		INX
		DECB
		BNE		BUCLE_SUMAS
		STAA		SUMA+1
		LDD		SUMA
		LSRD
		LSRD
;		STD		PROMEDIO
		STAB		PROMEDIO
FIN		BRA		FIN

HAY_CARRY	INC		SUMA
		BRA		SIG


; Inicializacion Variable/s
		ORG		DIR_NUM
		DW		DIR_1ERNUM
		ORG		DIR_1ERNUM
		DB		238,254,249,239		; 4 NUMEROS ENTRE 0 Y 255

