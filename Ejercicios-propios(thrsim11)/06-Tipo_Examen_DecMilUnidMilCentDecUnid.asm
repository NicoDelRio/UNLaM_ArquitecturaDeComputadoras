* Dado un numero entero sin signo de 16 bits, informar:
* decena de mil, unidad de mil, centenas, decenas y unidades en cinco posiciones de memoria

;Etiquetas		;Comando	;Operando	;Comentario

; Declaracion de Constantes
RAM			EQU		$0000
ROM			EQU		$8000

; Declaracion de Variables
			ORG		RAM
NUMERO			RMB		2		; Numero entero sin signo de 16 bits
DEC_MIL			RMB		1
UNI_MIL			RMB		1
CENTENA			RMB		1
DECENA			RMB		1
UNIDAD			RMB		1

; Codigo
			ORG		ROM
			LDD		NUMERO		; D = NUMERO (16 BITS)
			LDX		#10		; X = 10
			IDIV				; D/X->X , R->D (B = UNIDAD)
			STAB		UNIDAD
			XGDX				; X->D, D->X
 			LDX		#10		; X = 10
			IDIV				; D/X->X , R->D (B = DECENA)
			STAB		DECENA
			XGDX				; X->D, D->X
 			LDX		#10		; X = 10
			IDIV				; D/X->X , R->D (B = CENTENA)
			STAB		CENTENA
			XGDX				; X->D, D->X
 			LDX		#10		; X = 10
			IDIV				; D/X->X , R->D (B = UNI_MIL)
			STAB		UNI_MIL
			XGDX				; X->D (B = DEC_MIL), D->X
			STAB		DEC_MIL
FIN			BRA		FIN

; Inicializacion Variable/s
			ORG		NUMERO
			DW		65535		; RANGO: 0 A 65535 (numero entero sin signo de 16 bits)