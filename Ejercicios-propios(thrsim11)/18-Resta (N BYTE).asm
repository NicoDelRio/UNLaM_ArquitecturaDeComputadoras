; Programa: 18-Resta N BYTE

RAM			EQU		$0000			; RAM0Start (Memory Configuration) Para el ORG de 1ra Parte
ROM			EQU		$8000			; ROM0Start (Memory Configuration) Para el ORG de 2da Parte


; 1ra Parte: Declaracion de variables
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		RAM			; Dir donde se declaran las variables y constantes
BYTES			EQU		16			; EQU = Constante
OPERANDO1		RMB		BYTES			; Variable de N BYTES de tamaño
OPERANDO2		RMB		BYTES			; Idem OPERANDO1
RESULTADO		RMB		BYTES			; Variable de "N BYTES" de tamaño. 
							
; 2da Parte: Codigo del Programa
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		ROM
			LDY		#(OPERANDO1+BYTES-1)
			LDX		O,Y
			SUBD		BYTES,Y
			STD		BYTES*2,Y



; 3ra Parte: Asignacion de valores a las variables
; 1ra Parte: Declaracion de constantes y variables
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		OPERANDO1		; Dir donde se declara la variable OPERANDO1
			DB		$96,$F5,$DA,$4C,$00,$DE,$8F,$A2,$05,$28,$F2,$2C,$DB,$BD,$C1,$35
			ORG		OPERANDO2		; Dir donde se declara la variable OPERANDO2
			DB		$00,$A6,$10,$9B,$F5,$07,$44,$E6,$59,$42,$CF,$2A,$19,$51,$9A,$A9

; RESULTADO INICIALIZADO EN 0 EN EL CODIGO
; COMENTADO		ORG		RESULTADO		; Dir donde se declara la variable
; COMENTADO		DB		$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00





