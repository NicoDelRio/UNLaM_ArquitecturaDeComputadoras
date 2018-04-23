; 24-Tipo_Examen_Incrementar_Num_16BITS_desde_0_hasta_65535


RAM			EQU		$0000
ROM			EQU		$8000

			ORG		ROM
			LDD		#0
BUCLE			ADDD		#1	
			BHS		BUCLE
FIN			BRA		FIN

