; 13-Tipo_Examen_Vector_de_256_elementos_de(16bits)(sin_ERROR)
; SIN ERROR EN LAS VARIABLES.
; SI LOS 256 ELEMENTOS DEL VECTOR CUMPLIRIAN UNA/VARIAS DE LAS CONDICIONES (ACUM = 00)

* Dado un vector de 256 elementos, obtener la cantidad de negativos,
* multiplos de 8 y nulos del mismo
* Se conoce la direccion inicial

* En el juego de prueba repito 32 veces los mismos valores (08,04,02,01,$81,$82,$80,$00), por tanto hay:
* - 32 ceros (20h)
* - 96 negativos (60h)
* - 96 multiplos de ocho (60h)

* Recordar que cero es m�ltiplo de 8 y los negativos pueden ser m�ltiplos de 8
***********************************************************************************************************
* IMPORTANTE: Para simular este ejercicio debe cambiar la configuracion de la memoria
* View->Memory->Memory configuration. Cerrar� todo, establezca el �rea de RAMOEnd de 00FF a (por ejemplo) 02FF.
***********************************************************************************************************

; CONSTANTES
RAM			EQU		$0000
ROM			EQU		$8000
CICLOS			EQU		256			; CANTIDAD DE ELEMENTOS DEL VECTOR
MULTIPLO		EQU		8

; VARIABLES
			ORG		RAM
cantC			RMB		2			* ceros
cantN			RMB		2			* negativos
cantO			RMB		2			* multiplos de ocho

************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
; VECTOR IDEM AL EJER 11 CARGADO CON DW (CON ESTE VECTOR, NO HAY NUMEROS NEGATIVOS PORQUE EL "$81,$82,$80" QUEDA EN EL BYTE MENOS SIGNIFICATIVO). SI COINCIDEN LA CANTIDAD DE CEROS Y MULTIPLOS DE 8.
;vector 		DW		08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00,08,04,02,01,$81,$82,$80,$00
************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
; VECTOR IDEM AL EJER 11 CARGADO CON DB (CON "$00," ANTES DE CADA VALOR) (POR SER CADA ELEMENTO DE 2 BYTES)
;vector		DB		$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00
;		DB		$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00
;		DB		$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00,$00,08,$00,04,$00,02,$00,01,$00,$81,$00,$82,$00,$80,$00,$00
************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
; VECTOR IDEM AL EJER 11 CARGADO CON DW (REEMPLAZANDO LOS "$81,$82,$80" POR "$8001,$8002,$8000". COINCIDEN LAS TRES CANTIDAD (CEROS, NEGATIVOS Y MULTIPLOS DE 8).
vector		DW		08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00
		DW		08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00,08,04,02,01,$8001,$8002,$8000,$00
************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
; VECTOR IDEM AL EJER 11 CARGADO CON DW "TODOS NEGATIVOS". (EMPEZANDO CON "$80")
; SIN ERROR EN "cantN" POR SER LOS 256 ELEMENTOS DEL VECTOR NEGATIVOS (cantN = 01 , cantN+1 = 00)
;vector		DW		$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000
;		DW		$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000,$8008,$8004,$8002,$8001,$8081,$8082,$8080,$8000
************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

; CODIGO
			ORG		ROM
			CLR		cantC			; INICIALIZO LAS VARIABLES
			CLR		cantC+1
			CLR		cantN
			CLR		cantN+1
			CLR		cantO
			CLR		cantO+1
			LDY		#(VECTOR)		; Y = DIR 1ER ELEM VECTOR
BUCLE
			LDD		0,Y			; BUCLE SE REPITE "CICLOS" VECES
			BNE		NO_CERO			; (?Z=0). IF(!D==0) -> SALTA A NO_CERO
			INC		cantC+1			; IF(D==0) -> cantC(Low)++
			BNE		NO_CERO			; (?Z=0). SI cantC(Low) QUEDO EN CERO DESPUES DE SUMAR, cantC(High)++.
			INC		cantC			; cantC(High)++
NO_CERO
			TSTA					; (A-0)
			BPL		NO_NEG			; (?N=0). IF(!D<0) -> SALTA A NO_NEG
			INC		cantN+1			; IF(D<0) -> cantN(L)++
			BNE		NO_NEG			; (?Z=0). SI cantN(Low) QUEDO EN CERO DESPUES DE SUMAR, cantN(High)++.
			INC		cantN			; cantN(High)++
NO_NEG
			BITB		#%0111
			BNE		NO_MULTIPLO		; IF(!B==0) -> SALTA A NO_MULTIPLO
			INC		cantO+1			; IF(A==0 && B==0) -> cantO(L)++
			BVC		NO_MULTIPLO		; (?V=0). SI NO HUBO OVERFLOW, SALTA.
			INC		cantO			; cantO(High)++
NO_MULTIPLO
			INY					; Y+1 -> Y
			INY					; Y+1 -> Y (2 VECES)
;HORRIBLE		LDY		0,Y			; NO IDEM A INY (2 VECES). "DATO" (2 BYTES) EN DIR (Y+2) -> Y
			CPY		#(VECTOR+CICLOS*2)	; #(VECTOR+CICLOS*2) = DIR ULTIMO ELEM VECTOR. (*2 PORQUE LOS ELEM DEL VECTOR SON DE 2 BYTES)
			BNE		BUCLE			; IF(Y==DIR ULTIMO ELEM VECTOR) -> SALE DEL BUCLE (SINO REPITE "CICLOS" VECES).
FIN			BRA		FIN
