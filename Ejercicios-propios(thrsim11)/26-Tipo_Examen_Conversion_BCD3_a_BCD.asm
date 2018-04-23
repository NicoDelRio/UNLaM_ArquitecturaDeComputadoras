; 26-Tipo_Examen_Conversion_BCD3_a_BCD
; Archivo: Arquitectura de computadoras - Parcial_03.docx
; 5.- Escribir un programa para el 68HC11 que permita convertir un elemento numérico expresado en BCD exceso 3 a su equivalente BCD.
; Se conocen como datos la posición de memoria en que se almacena el dato original y la posición de memoria en que debe almacenarse 
; el resultado.


			ORG		$0000
DATO			RMB		1
RESULTADO		RMB		1


			ORG		$8000
			LDAA		DATO
			SUBA		#3
			STAA		RESULTADO
FIN			BRA		FIN


			ORG		DATO		;DEC	BCD	EXC3
;			DB		%0011		;0	$00	$03
;			DB		%0100		;1	$01	$04
;			DB		%0101		;2	$02	$05
;			DB		%0110		;3	$03	$06
;			DB		%0111		;4	$04	$07
;			DB		%1000		;5	$05	$08
;			DB		%1001		;6	$06	$09
;			DB		%1010		;7	$07	$0A
;			DB		%1011		;8	$08	$0B
;			DB		%1100		;9	$09	$0C


