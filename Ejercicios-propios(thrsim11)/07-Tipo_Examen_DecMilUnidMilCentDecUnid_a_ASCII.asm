; 07-Tipo_Examen_DecMilUnidMilCentDecUnid_a_ASCII

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
			LDX		#0010
			IDIV				; D/X->X , r->D (B=UNIDAD)
			ADDB		#'0'		; UNIDAD + 0 (ASCII) = UNIDAD EN ASCCI
			STAB		UNIDAD
			XGDX				; X->D , D->X
			LDX		#0010
			IDIV				; D/X->X , r->D (B=DECENA)
			ADDB		#'0'		; DECENA + 0 (ASCII) = DECENA EN ASCCI
			STAB		DECENA
			XGDX				; X->D , D->X
			LDX		#0010
			IDIV				; D/X->X , r->D (B=CENTENA)
			ADDB		#'0'		; CENTENA + 0 (ASCII) = CENTENA EN ASCCI
			STAB		CENTENA
			XGDX				; X->D , D->X
			LDX		#0010
			IDIV				; D/X->X , r->D (B=UNI_MIL)
			ADDB		#'0'		; UNI_MIL + 0 (ASCII) = UNI_MIL EN ASCCI
			STAB		UNI_MIL
			XGDX				; X->D (B=DEC_MIL) , D->X
			ADDB		#'0'		; DEC_MIL + 0 (ASCII) = DEC_MIL EN ASCCI
			STAB		DEC_MIL
FIN			BRA		FIN

; Inicializo variables
			ORG		NUMERO
			DW		65432		; RANGO: 0 A 65535







