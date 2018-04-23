; 11-Tipo_Examen_Vector_de_256_elementos_de(8bits)(con_ERROR)
; ERROR EN LAS VARIABLES SI LOS 256 ELEMENTOS DEL VECTOR CUMPLIRIAN UNA/VARIAS DE LAS CONDICIONES (ACUM = 00)
* Dado un vector de 256 elementos, obtener la cantidad de negativos,
* multiplos de 8 y nulos del mismo
* Se conoce la direccion inicial

* En el juego de prueba repito 32 veces los mismos valores (08,04,02,01,$81,$82,$80,$00), por tanto hay:
* - 32 ceros (20h)
* - 96 negativos (60h)
* - 96 multiplos de ocho (60h)

* Recordar que cero es múltiplo de 8 y los negativos pueden ser múltiplos de 8
***********************************************************************************************************
* IMPORTANTE: Para simular este ejercicio debe cambiar la configuracion de la memoria
* View->Memory->Memory configuration. Cerrará todo, establezca el área de RAMend de 00FF a (por ejemplo) 01FF.
***********************************************************************************************************

; CONSTANTES
RAM			EQU		$0000
ROM			EQU		$8000
CICLOS			EQU		256
MULTIPLO		EQU		8

; VARIABLES
			ORG		RAM
* AUX			RMB		2
cantC			RMB		1			* ceros
cantN			RMB		1			* negativos
cantO			RMB		1			* multiplos de ocho
vector			db		08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00

; CODIGO
			ORG		ROM
			CLR		cantC			; INICIALIZO LAS VARIABLES
			CLR		cantN		
			CLR		cantO		
			LDY		#(VECTOR)		; Y = DIR 1ER ELEM VECTOR
			CLRA
BUCLE			LDAB		0,Y			; BUCLE SE REPITE "CICLOS" VECES
			BNE		NO_CERO			; (?Z=0). IF(!B==0) -> SALTA A NO_CERO
			INC		cantC			; IF(B==0) -> cantC++
NO_CERO			BPL		NO_NEG			; (?N=0). IF(!B<0) -> SALTA A NO_NEG
			INC		cantN			; IF(B<0) -> cantN++
NO_NEG			LDX		#MULTIPLO		; X = MULTIPLO
			IDIV					; D/X->X , r->D
			TSTB					; (B-0). SI r=0 (ES MULTIPLO) -> Z=0
			BNE		NO_MULTIPLO		; IF(!B==0) -> SALTA A NO_MULTIPLO
			INC		cantO			; IF(B==0) -> cantO++
NO_MULTIPLO		INY					; Y+1 -> Y
			CPY		#(VECTOR+CICLOS*1)	; #(VECTOR+CICLOS*1) = DIR ULTIMO ELEM VECTOR. (*1 PORQUE LOS ELEM DEL VECTOR SON DE 1 BYTE)
			BNE		BUCLE			; IF(Y==DIR ULTIMO ELEM VECTOR) -> SALE DEL BUCLE, (SINO REPITE "CICLOS" VECES).
FIN			BRA		FIN
