; 08-Tipo_Examen_DecMilUnidMilCentDecUnid_a_ASCII(con_BUCLE)

; Tomo un número de 16 bits y lo guardo en ASCII

; Declaro constantes
RAM			EQU		$0000
ROM			EQU		$8000

; Declaro variables
			ORG		RAM
NUMERO			RMB		2
DEC_MIL			RMB		1
UNI_MIL			RMB		1
CENTENA			RMB		1
DECENA			RMB		1
UNIDAD			RMB		1

; Codigo
			ORG		ROM
			LDD		NUMERO
			LDY		#UNIDAD		; Y=DIR UNIDAD
BUCLE			LDX		#0010
			IDIV				; D/X->X , r->D (B=DIGITO)
			ADDB		#'0'		; DIGITO + 0 (ASCII) = DIGITO EN ASCCI
			STAB		0,Y
			XGDX				; X->D , D->X
			DEY				; Y-1->Y
			CPY		#(DEC_MIL)	; Y-DEC_MIL. SI SON IGUALES Z=1, SINO Z=0.
			BNE		BUCLE		; IF(Z=0)
			ADDB		#'0'		; DEC_MIL + 0 (ASCII) = DEC_MIL EN ASCCI
			STAB		0,Y
FIN			BRA		FIN

; Inicializo variables
			ORG		NUMERO
			FDB		65535		; RANGO: 0 A 65535
			DB		0,0,0,0,0	; PARA INICIALIZAR EN CERO VARIABLES (DEC_MIL A UNIDAD)






