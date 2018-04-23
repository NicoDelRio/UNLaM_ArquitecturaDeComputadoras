; 15-Ordenar un vector(8 BITS)(DIR_INI Y DIR_FIN)

; CONSTANTES
RAM			EQU		$0000
ROM			EQU		$8000

; VARIABLES
			ORG		RAM
DIR_INI			RMB		2
DIR_FIN			RMB		2
HUBO_INTERCAMBIO	RMB		1

; CODIGO
			ORG		ROM
BUCLE
			LDX		DIR_INI
			CPX		DIR_FIN				; COMPARA (X=DIR_INI) CON DIR_FIN. SI SON IGUALES Z=1
			BEQ		FUERA_BUCLE			; ? Z = 1. AL SER DIR_INI == DIR_FIN, NO HAY NADA QUE ORDENAR Y SALE.
			CLR		HUBO_INTERCAMBIO
BUCLE_INTERNO
			LDD		0,X
			CBA						; A-B. SI N=0 A>B
;			BHS		INTERCAMBIAR			; ? C = 0  		(ORDENA DE < A > SIN SIGNO, IGUALES INTERCAMBIA)	
			BHI		INTERCAMBIAR			; ? C + Z = 0  		(ORDENA DE < A > SIN SIGNO, IGUALES NO INTERCAMBIA)	
;			BGT		INTERCAMBIAR			; ? Z + (N (+) V) = 0	(ORDENA DE < A > CON SIGNO, IGUALES NO INTERCAMBIA)	
;			BGE		INTERCAMBIAR			; ? N (+) V = 0		(ORDENA DE < A > CON SIGNO, IGUALES INTERCAMBIA)	
;			BCS		INTERCAMBIAR			; ? C = 1  		(ORDENA DE > A < SIN SIGNO, IGUALES NO INTERCAMBIA)	
;			BLS		INTERCAMBIAR			; ? C + Z = 1  		(ORDENA DE > A < SIN SIGNO, IGUALES INTERCAMBIA)	
;			BLE		INTERCAMBIAR			; ? Z + (N (+) V) = 1	(ORDENA DE > A < CON SIGNO, IGUALES INTERCAMBIA)	
;			BLT		INTERCAMBIAR			; ? N (+) V = 1		(ORDENA DE > A < CON SIGNO, IGUALES NO INTERCAMBIA)	
SIG
			INX			
			CPX		DIR_FIN				; SI X=DIR_FIN -> Z=1
			BNE		BUCLE_INTERNO
			TST		HUBO_INTERCAMBIO		; TESTEA HUBO_INTERCAMBIO
			BEQ		FUERA_BUCLE			; ? Z = 1. SI EN TODA UNA RECORRIDA NO HUBO INTERCAMBIO, YA ESTA ORDENADO Y SALE.
			LDY		DIR_FIN
			DEY
			STY		DIR_FIN				; EN LA ULTIMA POSICION YA QUEDO ORDENADO, Y POR ENDE SE RECORRE UNA MENOS.
			BRA		BUCLE
FUERA_BUCLE
FIN			BRA		FIN

INTERCAMBIAR		
			STAA		1,X				; A->M+1
			STAB		0,X				; B->M
			TST		HUBO_INTERCAMBIO		; SE TESTEA PARA VER SI ESTA EN CERO
			BNE		SIG				; SI YA NO ESTA EN 0, SALE DE LA SUBRUTINA
			INC		HUBO_INTERCAMBIO		; DE 0 LO INCREMENTA A 1. NO SE INCREMENTA DIRECTAMENTE PORQUE 
			BRA		SIG				; SI SE INCREMENTARA 256 (O UNO DE ESOS MULTIPLOS), QUEDARIA EN $00.

; INICIALIZACION DE VARIABLES
			ORG		DIR_INI
			DW		$0010
			ORG		DIR_FIN
			DW		($0010-1)+16			; +"CANT DE ELEMENTOS"

; CARGAR EL VECTOR
			ORG		$0010
			DB		$10,$50,$30,$80,$A0,$00,$40,$60,$20,$70,$90,$B0,$C0,$D0,$F0,$E0
;			DB		$00,$10,$20,$30,$40,$50,$60,$70,$80,$90,$A0,$B0,$C0,$D0,$E0,$F0
;			DB		$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
;			DB		$10
			DB		$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
