; 1ra Parte: Declaracion de constantes y variables
; ORG = set origin to.
;	Sintaxis: ORG <dirección/etiqueta>
;	Determina la dirección a partir de la que se ubicará el código siguiente.
;	De no emplearse las direcciones se asignan de forma consecutiva. 
;	No admite etiqueta (a su izquierda). La dirección de origen puede expresarse como números o como una etiqueta.
; EQU = "CONSTANTE". Equate to.
;	Sintaxis: <etiqueta> EQU <dirección/etiqueta/valor>
;	Es el equivalente a #define en C/C++. 
;	La etiqueta (de la izquierda) se asociará al valor/dirección de la derecha. 
;	Si se especifica una etiqueta a la derecha, la misma debe haberse definido.
;	EQU puede usarse para crear símbolos de 8 o 16 bits.
; RMB = "VARIABLE". Reserve memory bytes.
;	Sintaxis: <etiqueta> RMB <cantidad de bytes/etiqueta>
;	Reserva una cantidad de bytes y la asocia al identificador etiqueta (de la izquierda). 
;	Aunque no define un tipo de dato, es similar a la declaración de variable en C/C++. 
;	(Asigna memoria, determina tamaño, asocia un nombre). La etiqueta queda relacionada a la dirección 
;	del byte más significativo (en palabras multibyte). 
;	El ensamblador reemplazará <etiqueta> (de la izquierda) por la dirección correspondiente. 
;	Para palabras multibytepuede indicársele al ensamblador que realice alguna operación aritmética con 
;	dicha dirección.
; FCB o DB = "VECTOR de 1 byte el dato". Form constant byte.
;	Sintaxis:  <etiqueta> FCB <valores separados por coma>
; FDB o DW = "VECTOR de 2 bytes el dato". Form constant double byte.
;	Sintaxis:  <etiqueta> FCB <valores separados por coma>
;	Define un vector cuyos elementos ocupan dos bytes cada uno, y lo asocia a <etiqueta>.
;	Esta directiva asigna memoria y la inicializa. Puede usarse para un solo elemento.


; 2da Parte: Codigo del Programa
; Convención de prefijos en el ensamblador THRSim:
; $ hexadecimal
; @ octal
; % binario
; ' ascii(comilla simple)
; # modo de direccionamiento inmediato


; 3ra Parte: Asignacion de valores a las variables
; <Etiqueta> (FCB/DB/FDB/DW) <Valor (empieza con #)/ Direccion>
; Se puede Hardcodear a traves del Memory Dump.
; Por fila aparecen 16 dir de 8 bits
; $0000 "ff" (dir de memoria 0000)
; $0000 ff ff ff "ff" (dir de memoria 0003)
; $0010 "ff" (dir de memoria 0016 = 10 Hexadecimal)

*-------------------------------------------------------------------------------------------------------------------------------------------
; Programa: 01-Suma en N Bytes

; 1ra Parte: Declaracion de constantes y variables
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		$0000			; Dir donde se declaran las variables y constantes
MAIN			EQU		$8000			; ROM0Start (Memory Configuration) Para el ORG de 2da Parte
BYTES			EQU		4			; EQU = Constante
OPERANDO1		RMB		BYTES			; Variable de N BYTES de tamaño
OPERANDO2		RMB		BYTES			; Idem OPERANDO1
RESULTADO		RMB		BYTES+1			; Variable de "N BYTES + 1" de tamaño. 
								; El +1 es para el Carry de la suma de los Bytes mas signif de los operandos

; 2da Parte: Codigo del Programa
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		MAIN			; GUARDA A PARTIR DEL ROM0Start
			CLC					; CLC: Clear Carry Bit: (0 -> C)
			LDX		#(OPERANDO1+BYTES-1)	; Guarda en X la dir de OPERANDO1 menos significativo. PUNTERO
			LDAB		#(BYTES)		; Guarda en B la cantidad de iteracciones (como cant de un FOR)
SUMAS_PARC		LDAA		0,X			; Guarda en Acum A dato de la dir de REG X (ACTUAL)
			ADCA		BYTES,X			; Add with Carry to A: (A+M+C->A)
			STAA		BYTES*2+1,X		; Guarda en RESULTADO el dato en A: (A->M)
			DEX					; IX-1 -> IX. Decrementa X
			DECB					; B-1 -> B. Decrementa B. Si quedo en CERO, Z=1
			BNE		SUMAS_PARC		; (?Z=0). Si Z=1, sale del bucle.
			BHS		NO_CARRY		; (?C=0). Si C=0 salta a NO_CARRY. Si C=1, byte mas sign de RESULTADO = 1.
			INC		RESULTADO		; Byte de RESULTADO mas signif 1, si C=1.
NO_CARRY
FIN			BRA		FIN			; BRA (rel): Branch Always: (? 1 = 1)
								; LOS PROG SIEMPRE FINALIZAN CON UN BUCLE (LOOP).



; 3ra Parte: Asignacion de valores a las variables
; 1ra Parte: Declaracion de constantes y variables
; Etiqueta		; Instruccion	; Operando		; Comentario
			ORG		OPERANDO1		; Dir donde se declara la variable
			DB		$FA,$10,$20,$30
			ORG		OPERANDO2		; Dir donde se declara la variable
			DB		$11,$10,$20,$30
			ORG		RESULTADO		; Dir donde se declara la variable
			DB		$00,$00,$00,$00,$00





