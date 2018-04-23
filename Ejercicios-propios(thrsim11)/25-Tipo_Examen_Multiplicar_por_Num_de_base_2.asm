; 25-Tipo_Examen_Multiplicar_por_Num_de_base_2
; MULTIPLICAR POR 4

RAM			EQU		$0000
ROM			EQU		$8000


			ORG		RAM
NUM			RMB		1
RDO			RMB		2

			ORG		ROM
			CLRA
			LDAB		NUM
			ASLD				; D*2->D
			ASLD				; D*2->D
			STD		RDO
FIN			BRA		FIN

			ORG		NUM
			DB		150		; DE 0 A 255

