; 21-Tipo_Examen_Convertir_Numero_de_BIN_a_DEC
; Archivo: Arquitectura de computadoras - Parcial_01.jpg
; Se desea convertir a decimal un numero binario de ocho bits almacenado en la posicion de memoria $0000.
; El resultado debe quedar almacenado de la siguiente forma:
; Posicion $0001 = CENTENA
; Posicion $0002 = DECENA
; Posicion $0003 = UNIDAD


RAM		EQU		$0000
ROM		EQU		$8000



		ORG		RAM
NUM_BIN		RMB		1
CENTENA		RMB		1
DECENA		RMB		1
UNIDAD		RMB		1

		ORG		ROM
		CLRA
		LDAB		NUM_BIN
		LDX		#10
		IDIV
		STAB		UNIDAD
		XGDX
		LDX		#10
		IDIV	
		STAB		DECENA
		XGDX
		STAB		CENTENA
FIN		BRA		FIN

;INICIALIZACION VARIABLE
		ORG		NUM_BIN
		DB		203			; ENTRE 0 Y 255

