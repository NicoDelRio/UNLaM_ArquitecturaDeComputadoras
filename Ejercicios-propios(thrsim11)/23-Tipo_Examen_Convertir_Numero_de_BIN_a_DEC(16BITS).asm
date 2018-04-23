; 23-Tipo_Examen_Convertir_Numero_de_BIN_a_DEC(16BITS)
; Archivo: Arquitectura de computadoras - Parcial_02.jpg
; Se desea convertir a decimal un numero binario de 16 bits almacenado en la posicion de memoria $0000 Y $0001.
; El resultado debe quedar almacenado de la siguiente forma:
; Posicion $0010 = DECENA DE MIL
; Posicion $0011 = UNIDAD DE MIL
; Posicion $0012 = CENTENA
; Posicion $0013 = DECENA
; Posicion $0014 = UNIDAD


DIR_NUM_BIN	EQU		$0000
DIR_NUM_DEC	EQU		$0010
ROM		EQU		$8000


		ORG		DIR_NUM_BIN
NUM_BIN		RMB		2
		ORG		DIR_NUM_DEC	
DEC_DE_MIL	RMB		1
UNI_DE_MIL	RMB		1
CENTENA		RMB		1
DECENA		RMB		1
UNIDAD		RMB		1

		ORG		ROM
		LDY		#UNIDAD
		LDD		NUM_BIN
BUCLE		LDX		#10
		IDIV
		STAB		0,Y
		XGDX
		DEY
		CPY		#DEC_DE_MIL
		BNE		BUCLE
		STAB		0,Y
FIN		BRA		FIN


;INICIALIZACION VARIABLE
		ORG		NUM_BIN
		DW		65432			; ENTRE 0 Y 65535

