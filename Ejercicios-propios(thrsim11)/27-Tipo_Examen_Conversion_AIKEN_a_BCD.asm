; 27-Tipo_Examen_Conversion_AIKEN_a_BCD
; Escribir un programa para el 68HC11 que permita convertir un elemento numérico expresado en AIKEN a su equivalente BCD.
; Se conocen como datos la posición de memoria en que se almacena el dato original y la posición de memoria en que debe almacenarse 
; el resultado.
; En el código BCD natural, los pesos son: 8 – 4 – 2 – 1, en el código Aiken la distribución es: 2 – 4 – 2 – 1.
; Ver la simetría en el código Aiken corresponiente a los decimales: 4 y 5, 3 y 6, 2 y 7, 1 y 8, 0 y 9.
; DECIMAL	AIKEN
;		2421
;	O	0000 (IDEM A BCD)
;	1	0001 (IDEM A BCD)
;	2	0010 (IDEM A BCD)
;	3	0011 (IDEM A BCD)
;	4	0100 (IDEM A BCD)
;	5	1011 (LE SUMA 6 A BCD)
;	6	1100 (LE SUMA 6 A BCD)
;	7	1101 (LE SUMA 6 A BCD)
;	8	1110 (LE SUMA 6 A BCD)
;	9	1111 (LE SUMA 6 A BCD)

			ORG		$0000
DATO			RMB		1
RESULTADO		RMB		1


			ORG		$8000
			LDAA		DATO
			BITA		#%1000		; Z=0 SI (0 <= DATO <=4) / Z=1 SI (5 <= DATO <=9)
			BEQ		NO_RESTA
			SUBA		#6
NO_RESTA		STAA		RESULTADO
FIN			BRA		FIN


			ORG		DATO		;AIKEN	BCD	
;			DB		%0000		;$00	$00	
;			DB		%0001		;$01	$01
;			DB		%0010		;$02	$02
;			DB		%0011		;$03	$03
;			DB		%0100		;$04	$04
;			DB		%1011		;$0B	$05
;			DB		%1100		;$0C	$06
;			DB		%1101		;$0D	$07
;			DB		%1110		;$0E	$08
			DB		%1111		;$0F	$09


