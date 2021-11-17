!classDefinition: #TestDeMovimientoMarsRover category: 'TDD-MarsRover'!
TestCase subclass: #TestDeMovimientoMarsRover
	instanceVariableNames: 'puntoCardinalNorte puntoCardinalSur puntoCardinalEste puntoCardinalOeste posicionInicial'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!TestDeMovimientoMarsRover methodsFor: 'setUp' stamp: 'belen 11/16/2021 15:14:37'!
setUp

	puntoCardinalNorte :=  'N'.
	puntoCardinalSur := 'S'.
	puntoCardinalEste := 'E'.
	puntoCardinalOeste := 'O'.
	
	posicionInicial := (1@1).! !


!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test02ElMovimientoDeMarsRoverSeInicializaConUnPuntoCardinalInvalidoYSeLanzaUnaExcepcion

	|puntoCardinalErroneo|
	
	puntoCardinalErroneo := 'P'.

	
	
	self 
	should: [MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalErroneo ]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorPuntoCardinalEsInvalido ].

! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test05SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlNorte

	|xxx cadena posicionDestino |
		
	posicionDestino := (5@1).
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte .
	cadena := 'ffff'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.


	self assert: true equals: (xxx estaEnLaPosicion: posicionDestino).! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test07SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlSur

	|xxx cadena posicion |
		

	posicion := (5@1).
		
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalSur .
	cadena := 'ffff'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.

	self assert: true equals: (xxx estaEnLaPosicion: posicionInicial).! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test09SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlNorte

	|xxx cadena posicion |
	
	posicion := (3@1).
		
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalNorte .
	cadena := 'bb'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.

	"self assert: (xxx movimiento: cadena) equals: (3@1)."
	self assert:  (xxx estaEnLaPosicion: posicionInicial) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test10SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverEnDireccionAlNorte

	|xxx cadena posicionDestino|

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte.
	cadena := 'frfrf'.
	
	posicionDestino := (1@2).
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.

	
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test11SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlEste

	|xxx cadena posicionDestino |
		

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalEste.
	cadena := 'ffff'.
	posicionDestino := (1@5).
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.


	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test12SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlEste

	|xxx cadena posicion posicionDestino puntoCardinal|
		
	puntoCardinal := 'E'.
	posicion := (2@5).
	posicionDestino := (2@1).
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinal.
	cadena := 'bbbb'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.


	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:54'!
test14SeRecibeUnaCadenaDeComandosParaMoverseEnDireccionAlOesteYMarsRoverSeMueveHaciaAdelante

	|xxx cadena posicion puntoCardinal|
	
	posicion := (1@5).
		
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalOeste .
	cadena := 'ffff'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.

	
	self assert:  (xxx estaEnLaPosicion: posicionInicial) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test16SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlOeste

	|xxx cadena posicionDestino |
		
	
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	cadena := 'bbb'.
	posicionDestino := (1@4).
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.


	
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test18SeRecibeUnaCadenaDeComandosParaMoverseHaciaDistintosSentidosApuntandoHaciaElNorteYMarsRoverSeMueve

	|xxx cadena posicionDestino |
		
	posicionDestino := (3@1).
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte.
	cadena := 'ffbfbf'.
	
	xxx movimiento: cadena.


	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test19ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElOeste

	|xxx movimiento   posicionDestino |
		

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte .
	
	movimiento := 'ffl'.
	posicionDestino := (3@1).
	xxx movimiento: movimiento.
	
	self assert: true equals:  xxx estaEnLaDireccionOeste .
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:54'!
test20ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElNorte

	|xxx movimiento posicionDestino |
		

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalEste.
	movimiento := 'ffflf'.
	
	posicionDestino := (2@4).
	
	xxx movimiento: movimiento.
	
	self assert: true equals: xxx estaEnLaDireccionNorte .
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test21ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElEste

	|xxx movimiento posicion posicionDestino|
		

	posicion := (4@2).
		
	posicionDestino := (3@2).
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalSur.
	movimiento := 'fl'.
	
	xxx movimiento: movimiento.

	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert:  true equals:  xxx estaEnLaDireccionEste .
	
	
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test22ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElNorte

	|xxx movimiento posicionDestino |
		
	
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	movimiento := 'br'.
	
	posicionDestino := (1@2).
	
	xxx movimiento: movimiento.
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	
	
	
	self assert: true equals:  xxx estaEnLaDireccionNorte.

	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:54'!
test23MarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteYFinalmenteHaciaElEste

	|xxx movimiento posicionDestino |
		
	
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	movimiento := 'brr'.
	
	posicionDestino := (1@2).
	
	xxx movimiento: movimiento.
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	self assert:  true equals:  xxx estaEnLaDireccionEste .

	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test24ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteYFinalmenteHaciaElSur

	|xxx movimiento posicionDestino |
		
	
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	movimiento := 'brrr'.
	
	posicionDestino := (1@2).
	
	xxx movimiento: movimiento.
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert: true equals: xxx estaEnLaDireccionSur.

	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test25ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteLuegoHaciaElSurYFinalmenteHaciaElOeste

	|xxx movimiento posicionDestino |
		
	
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	movimiento := 'brrrr'.
	
	posicionDestino := (1@2).
	
	xxx movimiento: movimiento.
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	self assert: true equals: xxx estaEnLaDireccionOeste.

	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test26SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlSur

	|xxx cadena posicion |
		

	posicion := (5@1).
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalSur .
	cadena := 'bbbb'.
	
	
	"mov -> validarSecuencia -> movHacia y movRotar"
	xxx movimiento: cadena.

	self assert: true equals: (xxx estaEnLaPosicion: posicion).! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test27ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElEste

	|xxx movimiento   posicionDestino |
		

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte .
	
	movimiento := 'ffr'.
	posicionDestino := (3@1).
	xxx movimiento: movimiento.
	
	self assert: true equals:  xxx estaEnLaDireccionEste .
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:54'!
test28ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElSur

	|xxx movimiento posicionDestino |
		

	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalEste.
	movimiento := 'fffrf'.
	
	posicionDestino := (0@4).
	
	xxx movimiento: movimiento.
	
	self assert: true equals: xxx estaEnLaDireccionSur .
	self assert:  (xxx estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test29ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElOeste

	|xxx movimiento posicion posicionDestino|
		

	posicion := (4@2).
		
	posicionDestino := (3@2).
	xxx := MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalSur.
	movimiento := 'fr'.
	
	xxx movimiento: movimiento.

	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert:  true equals:  xxx estaEnLaDireccionOeste .
	
	
	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test30ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElSur

	|xxx movimiento posicionDestino |
		
	
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalOeste .
	movimiento := 'bl'.
	
	posicionDestino := (1@2).
	
	xxx movimiento: movimiento.
	
	self assert:  (xxx estaEnLaPosicion: posicionDestino ) equals: true.
	
	
	
	self assert: true equals:  xxx estaEnLaDireccionSur.

	
	
	
	! !

!TestDeMovimientoMarsRover methodsFor: 'tests' stamp: 'Melany 11/16/2021 20:07:53'!
test31SeRecibeUnaCadenaDeComandosDondeUnoEsErroneoYSeLanzaUnaExcepcion

	|xxx cadena posicion |
	
	posicion := (2@1).
		
	xxx := MovimientoDeMarsRover initializeWith: posicionInicial andWithCardinalPoint: puntoCardinalNorte .
	cadena := 'ffbxf'.
	
	self 
	should: [xxx movimiento: cadena]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorComandoInvalido ].
	
	self assert:  (xxx estaEnLaPosicion: posicion) equals: true.
	! !


!classDefinition: #DireccionesDeMovimientoDeMarsRover category: 'TDD-MarsRover'!
Object subclass: #DireccionesDeMovimientoDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionesDeMovimientoDeMarsRover methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:55:55'!
moverseHaciaAdelante: marsRover


	self subclassResponsibility. 
! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:10:38'!
moverseHaciaAtras: marsRover


	self subclassResponsibility. 
! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:24:17'!
rotarHaciaLaDerecha: marsRovers

	self subclassResponsibility. ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:15:06'!
rotarHaciaLaIzquierda: marsRovers

	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionesDeMovimientoDeMarsRover class' category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover class
	instanceVariableNames: ''!

!DireccionesDeMovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:46:05'!
with: unCaracter

	self subclassResponsibility. ! !


!classDefinition: #DireccionDeMovimientoHaciaElEste category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElEste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:38:04'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElEste.! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'as yet unclassified' stamp: 'Melany 11/16/2021 18:58:12'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElEste. ! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:38:45'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElEste. ! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:38:58'!
rotarHaciaLaIzquierda: marsRovers

	marsRovers rotarHaciaLaIzquierdaDesdeElEste. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElEste class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElEste class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElEste class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:39:59'!
with: unCaracter

	^unCaracter = 'E'.! !


!classDefinition: #DireccionDeMovimientoHaciaElNorte category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElNorte methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:58:36'!
moverseHaciaAdelante: marsRover

	^marsRover moverseAAdelanteHaciaElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:10:54'!
moverseHaciaAtras: marsRover

	^marsRover moverseAAtrasHaciaElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:26:52'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:17:01'!
rotarHaciaLaIzquierda: marsRovers

	marsRovers rotarHaciaLaIzquierdaDesdeElNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElNorte class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElNorte class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElNorte class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:39:48'!
with: unCaracter

	^unCaracter = 'N'.! !


!classDefinition: #DireccionDeMovimientoHaciaElOeste category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElOeste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:44:09'!
moverseHaciaAdelante: marsRover


	marsRover moverseAAdelanteHaciaElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:44:26'!
moverseHaciaAtras: marsRover


	marsRover moverseAAtrasHaciaElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:44:44'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 16:45:02'!
rotarHaciaLaIzquierda: marsRovers

	marsRovers rotarHaciaLaIzquierdaDesdeElOeste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElOeste class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElOeste class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElOeste class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:40:06'!
with: unCaracter

	^unCaracter = 'O'.! !


!classDefinition: #DireccionDeMovimientoHaciaElSur category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElSur methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 17:02:43'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElSur.
	! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 17:02:57'!
moverseHaciaAtras: marsRover


	marsRover moverseAAtrasHaciaElSur.! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 17:03:21'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElSur.! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 17:03:37'!
rotarHaciaLaIzquierda: marsRovers

	marsRovers rotarHaciaLaIzquierdaDesdeElSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElSur class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElSur class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElSur class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:40:23'!
with: unCaracter

	^unCaracter = 'S'.! !


!classDefinition: #MovimientoDeMarsRover category: 'TDD-MarsRover'!
Object subclass: #MovimientoDeMarsRover
	instanceVariableNames: 'posicion direccionDelMovimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MovimientoDeMarsRover methodsFor: 'ubicacion - privada' stamp: 'Melany 11/16/2021 20:10:28'!
direccionDeMarsRover: unCaracter

	
	
	| direccionActual|
	direccionActual := DireccionesDeMovimientoDeMarsRover subclasses detect:[:subclass | subclass with: unCaracter].
	
	^ direccionActual new.
	! !



!MovimientoDeMarsRover methodsFor: 'testing - privado' stamp: 'Melany 11/16/2021 20:05:41'!
elComandoEsValido: comando
 
	^ #($f, $b, $l, $r) includes: comando.! !


!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'Melany 11/16/2021 20:13:55'!
estaEnLaDireccionEste

	^ direccionDelMovimiento isKindOf: DireccionDeMovimientoHaciaElEste.! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'Melany 11/16/2021 20:13:55'!
estaEnLaDireccionNorte

	^ direccionDelMovimiento isKindOf: DireccionDeMovimientoHaciaElNorte.! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'Melany 11/16/2021 20:13:55'!
estaEnLaDireccionOeste

	^ direccionDelMovimiento isKindOf: DireccionDeMovimientoHaciaElOeste.! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'Melany 11/16/2021 20:13:55'!
estaEnLaDireccionSur

	^ direccionDelMovimiento isKindOf: DireccionDeMovimientoHaciaElSur.! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'belen 11/16/2021 15:31:59'!
estaEnLaPosicion: unaPosicion

	^posicion = unaPosicion.! !


!MovimientoDeMarsRover methodsFor: 'inicializacion' stamp: 'Melany 11/16/2021 20:13:55'!
inicializarCon: puntoInicial YConPuntoCardinal: unPuntoCardinal
	
	posicion := puntoInicial. 
	
	"direccion := unPuntoCardinal."
	
	
	direccionDelMovimiento := self direccionDeMarsRover: unPuntoCardinal.! !


!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:35:59'!
moverseAAdelanteHaciaElEste

	posicion := posicion + (0@1).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 15:59:37'!
moverseAAdelanteHaciaElNorte

	posicion := posicion + (1@0).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:47:16'!
moverseAAdelanteHaciaElOeste

	posicion := posicion - (0@1).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:06:17'!
moverseAAdelanteHaciaElSur

	posicion:= posicion - (1@0).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:35:46'!
moverseAAtrasHaciaElEste

	posicion := posicion - (0@1).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:00:10'!
moverseAAtrasHaciaElNorte

	posicion := posicion - (1@0).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:48:28'!
moverseAAtrasHaciaElOeste

	posicion := posicion + (0@1).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:06:35'!
moverseAAtrasHaciaElSur

	posicion := posicion + (1@0).! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
movimiento: cadena

	cadena do: [:comando |
		(self elComandoEsValido: comando) ifFalse: [ self error: MovimientoDeMarsRover errorComandoInvalido].
		(comando = $f) ifTrue:[direccionDelMovimiento moverseHaciaAdelante: self].
		(comando = $b) ifTrue:[direccionDelMovimiento moverseHaciaAtras: self].
		(comando = $l) ifTrue:[direccionDelMovimiento rotarHaciaLaIzquierda:self].
		(comando = $r) ifTrue:[direccionDelMovimiento rotarHaciaLaDerecha: self].
		"
		(direccion = 'N')ifTrue: [self moverseHaciaElNorteEn:  comando]ifFalse:[
			
			(direccion = 'S')ifTrue: [self moverseHaciaElSurEn:  comando] ifFalse:[
			(direccion = 'E')ifTrue: [self moverseHaciaElEsteEn:  comando].
			(direccion = 'O')ifTrue: [self moverseHaciaElOesteEn:  comando].
			].
		]."
		]



	"1 to: (cadena size) do:[: index | self moverseEn: (cadena at: index)]."! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaDerechaDesdeElEste


	direccionDelMovimiento := DireccionDeMovimientoHaciaElSur new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaDerechaDesdeElNorte


	direccionDelMovimiento := DireccionDeMovimientoHaciaElEste new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaDerechaDesdeElOeste


	direccionDelMovimiento := DireccionDeMovimientoHaciaElNorte new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaDerechaDesdeElSur


	direccionDelMovimiento := DireccionDeMovimientoHaciaElOeste new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaIzquierdaDesdeElEste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElNorte new.
	
	! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaIzquierdaDesdeElNorte

	direccionDelMovimiento := DireccionDeMovimientoHaciaElOeste new.
	
	! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaIzquierdaDesdeElOeste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElSur new.
	
	! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 20:13:55'!
rotarHaciaLaIzquierdaDesdeElSur

	direccionDelMovimiento := DireccionDeMovimientoHaciaElEste new.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovimientoDeMarsRover class' category: 'TDD-MarsRover'!
MovimientoDeMarsRover class
	instanceVariableNames: ''!

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'Melany 11/16/2021 19:58:12'!
errorComandoInvalido

	^ 'Error comando invalido'.! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/15/2021 12:26:54'!
errorPuntoCardinalEsInvalido

	^'Error el punto cardinal no es valido'.! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/15/2021 12:26:34'!
errorPuntoInicialEsInvalido

	^'Error el punto inicial no es valido'.! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 17:17:52'!
initializeWith: anInitialPoint andWithCardinalPoint: puntoCardinal


	(anInitialPoint isIntegerPoint) ifFalse: [self error: 'Error el punto inicial no es valido'].
	(#('N','S','E','O') includes: puntoCardinal ) ifFalse: [self error: 'Error el punto cardinal no es valido'].
	
	^self new inicializarCon: anInitialPoint YConPuntoCardinal: puntoCardinal.! !
