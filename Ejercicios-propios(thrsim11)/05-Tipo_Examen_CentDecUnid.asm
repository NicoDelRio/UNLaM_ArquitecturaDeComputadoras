* Dado un numero entero sin signo de 8 bits, informar:
* centenas, decenas y unidades en tres posiciones de memoria

;Etiquetas		;Comando	;Operando	;Comentario

; Declaracion de Constantes
RAM			EQU		$0000
ROM			EQU		$8000

; Declaracion de Variables
			ORG		RAM
NUMERO			RMB		1		; Numero entero sin signo de 8 bits
CENTENA			RMB		1
DECENA			RMB		1
UNIDAD			RMB		1

; Codigo
			ORG		ROM
			CLRA				; A = 0
			LDAB		NUMERO		; B = NUMERO (8 BITS)
							; D = 00 NUMERO
			LDX		#10		; X = 10
			IDIV				; D/X->X (CEN Y DEC), R->D (B = UNIDAD)
			STAB		UNIDAD
			XGDX				; X->D, D->X
 			LDX		#10		; X = 10
			IDIV				; D/X->X (CENTENA), R->D (B = DECENA)
			STAB		DECENA
			XGDX				; X->D (B = CENTENA), D->X
			STAB		CENTENA
FIN			BRA		FIN

; Inicializacion Variable/s
			ORG		NUMERO
			DB		12		; RANGO: 0 A 255 (numero entero sin signo de 8 bits)