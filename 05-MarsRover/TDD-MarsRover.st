!classDefinition: #TestDeMovimientoDeMarsRover category: 'TDD-MarsRover'!
TestCase subclass: #TestDeMovimientoDeMarsRover
	instanceVariableNames: 'puntoCardinalNorte puntoCardinalSur puntoCardinalEste puntoCardinalOeste posicionInicial cadenaDeComandosHaciaAdelante cadenaDeComandosHaciaAtras'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!TestDeMovimientoDeMarsRover methodsFor: 'setUp' stamp: 'Melany 11/17/2021 13:09:27'!
setUp

	puntoCardinalNorte :=  'N'.
	puntoCardinalSur := 'S'.
	puntoCardinalEste := 'E'.
	puntoCardinalOeste := 'O'.
	
	cadenaDeComandosHaciaAdelante := 'ffff'.
	cadenaDeComandosHaciaAtras := 'bbbb'.
	
	posicionInicial := (1@1).! !


!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:14:09'!
test01ElMovimientoDeMarsRoverSeInicializaConUnPuntoCardinalInvalidoYSeLanzaUnaExcepcion

	|puntoCardinalErroneo|
	
	puntoCardinalErroneo := 'P'.


	self 
	should: [self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalErroneo ]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorPuntoCardinalEsInvalido ].

! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:14:17'!
test02SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlNorte

	|movimientoDeMarsRover posicionDestino |
		
	posicionDestino := (5@1).

	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .

	self assert: true equals: (movimientoDeMarsRover estaEnLaPosicion: posicionDestino).! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:14:24'!
test03SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlSur

	|movimientoDeMarsRover posicion |
		

	posicion := (5@1).
		
	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .
	

	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .

	self assert: true equals: (movimientoDeMarsRover estaEnLaPosicion: posicionInicial).! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:20:50'!
test04SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlNorte

	|movimientoDeMarsRover posicion posicionDestino |
	
	posicion := (3@1).
		
	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .
	posicionDestino := (-1@1).
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:20:59'!
test05SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverEnDireccionAlNorte

	|movimientoDeMarsRover cadena posicionDestino|

	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.

	cadena := 'frfrf'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: cadena.

	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:05'!
test06SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlEste

	|movimientoDeMarsRover posicionDestino |
		

	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalEste.
	
	posicionDestino := (1@5).
	

	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .


	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:12'!
test07SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlEste

	|movimientoDeMarsRover posicion posicionDestino |
		
	posicion := (2@5).
	posicionDestino := (2@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalEste.

	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .


	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:20'!
test08SeRecibeUnaCadenaDeComandosParaMoverseEnDireccionAlOesteYMarsRoverSeMueveHaciaAdelante

	|movimientoDeMarsRover posicion |
	
	posicion := (1@5).
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste.

	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .

	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionInicial) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:28'!
test09SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlOeste

	| movimientoDeMarsRover posicionDestino |
		
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste.

	posicionDestino := (1@5).
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .


	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:36'!
test10SeRecibeUnaCadenaDeComandosParaMoverseHaciaDistintosSentidosApuntandoHaciaElNorteYMarsRoverSeMueve

	|movimientoDeMarsRover cadena posicionDestino |
		
	posicionDestino := (3@1).
	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.
	cadena := 'ffbfbf'.
	
	movimientoDeMarsRover movimiento: cadena.


	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:43'!
test11ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElOeste

	|movimientoDeMarsRover movimiento   posicionDestino |
		

	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.
	
	movimiento := 'ffl'.
	posicionDestino := (3@1).
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert: true equals:  movimientoDeMarsRover estaEnLaDireccionOeste .
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:51'!
test12ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElNorte

	|movimientoDeMarsRover movimiento posicionDestino |
		

	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalEste.

	movimiento := 'ffflf'.
	
	posicionDestino := (2@4).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert: true equals: movimientoDeMarsRover estaEnLaDireccionNorte .
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:21:59'!
test13ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElEste

	|movimientoDeMarsRover movimiento posicion posicionDestino|
		

	posicion := (4@2).
		
	posicionDestino := (3@2).
	movimientoDeMarsRover :=  self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur.

	movimiento := 'fl'.
	
	movimientoDeMarsRover movimiento: movimiento.

	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert:  true equals:  movimientoDeMarsRover estaEnLaDireccionEste .
	
	
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:22:09'!
test14ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElNorte

	|movimientoDeMarsRover movimiento posicionDestino |
		
	
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste .
	movimiento := 'br'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	
	
	
	self assert: true equals:  movimientoDeMarsRover estaEnLaDireccionNorte.

	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:22:19'!
test15MarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteYFinalmenteHaciaElEste

	|movimientoDeMarsRover movimiento posicionDestino |
		
	
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste. 

	movimiento := 'brr'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	self assert:  true equals:  movimientoDeMarsRover estaEnLaDireccionEste .

	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:22:26'!
test16ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteYFinalmenteHaciaElSur

	|movimientoDeMarsRover movimiento posicionDestino |
		
	
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste .

	movimiento := 'brrr'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert: true equals: movimientoDeMarsRover estaEnLaDireccionSur.

	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:22:41'!
test17ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteLuegoHaciaElSurYFinalmenteHaciaElOeste

	|movimientoDeMarsRover movimiento posicionDestino |
		
	
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste .
	movimiento := 'brrrr'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	self assert: true equals: movimientoDeMarsRover estaEnLaDireccionOeste.

	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:22:48'!
test18SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlSur

	|movimientoDeMarsRover posicion |
		

	posicion := (5@1).
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalSur .

	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .

	self assert: true equals: (movimientoDeMarsRover estaEnLaPosicion: posicion).! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:00'!
test19ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElEste

	|movimientoDeMarsRover movimiento   posicionDestino |
		

	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimiento := 'ffr'.
	posicionDestino := (3@1).
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert: true equals:  movimientoDeMarsRover estaEnLaDireccionEste .
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:07'!
test20ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElSur

	|movimientoDeMarsRover movimiento posicionDestino |
		

	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalEste .

	movimiento := 'fffrf'.
	
	posicionDestino := (0@4).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert: true equals: movimientoDeMarsRover estaEnLaDireccionSur .
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino) equals: true.
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:24'!
test21ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElOeste

	|movimientoDeMarsRover movimiento posicion posicionDestino|
		

	posicion := (4@2).
		
	posicionDestino := (3@2).
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .

	movimiento := 'fr'.
	
	movimientoDeMarsRover movimiento: movimiento.

	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	
	self assert:  true equals:  movimientoDeMarsRover estaEnLaDireccionOeste .
	
	
	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:31'!
test22ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElSur

	|movimientoDeMarsRover movimiento posicionDestino |
		
	
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalOeste .

	movimiento := 'bl'.
	
	posicionDestino := (1@2).
	
	movimientoDeMarsRover movimiento: movimiento.
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionDestino ) equals: true.
	
	
	
	self assert: true equals:  movimientoDeMarsRover estaEnLaDireccionSur.

	
	
	
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:40'!
test23SeRecibeUnaCadenaDeComandosDondeUnoEsErroneoYSeLanzaUnaExcepcion

	|movimientoDeMarsRover cadena posicion |
	
	posicion := (2@1).
		
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.

	cadena := 'ffbxf'.
	
	self 
	should: [movimientoDeMarsRover movimiento: cadena]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorComandoInvalido ].
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicion) equals: true.
	! !

!TestDeMovimientoDeMarsRover methodsFor: 'tests' stamp: 'Melany 11/17/2021 13:23:47'!
test24SeRecibeUnaCadenaDeComandosErroneaDesdeElInicioYSeLanzaUnaExcepcion

	|movimientoDeMarsRover cadena |
	
	movimientoDeMarsRover  := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.
	
	cadena := 'xxf'.
	
	self 
	should: [movimientoDeMarsRover movimiento: cadena]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorComandoInvalido ].
	
	self assert:  (movimientoDeMarsRover estaEnLaPosicion: posicionInicial) equals: true.
	! !


!TestDeMovimientoDeMarsRover methodsFor: 'inicializadorDeMovimientoDeMarsRover' stamp: 'Melany 11/17/2021 12:40:39'!
iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinal
	
	^ MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinal! !


!classDefinition: #DireccionesDeMovimientoDeMarsRover category: 'TDD-MarsRover'!
Object subclass: #DireccionesDeMovimientoDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 15:55:55'!
moverseHaciaAdelante: marsRover


	self subclassResponsibility. 
! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:10:38'!
moverseHaciaAtras: marsRover


	self subclassResponsibility. 
! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:24:17'!
rotarHaciaLaDerecha: marsRovers

	self subclassResponsibility. ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:15:06'!
rotarHaciaLaIzquierda: marsRovers

	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionesDeMovimientoDeMarsRover class' category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover class
	instanceVariableNames: ''!

!DireccionesDeMovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/18/2021 16:13:03'!
crearDireccionDeMovimientoAdecuadaParaMarsRover: unCaracter

	
	
	| direccionActual|
	direccionActual := DireccionesDeMovimientoDeMarsRover subclasses detect:[:subclass | subclass with: unCaracter].
	
	^ direccionActual new.
	! !

!DireccionesDeMovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'belen 11/16/2021 15:46:05'!
with: unCaracter

	self subclassResponsibility. ! !


!classDefinition: #DireccionDeMovimientoHaciaElEste category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:38:04'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElEste.! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'Melany 11/16/2021 18:58:12'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElEste. ! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:38:45'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElEste. ! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:38:58'!
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

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'belen 11/16/2021 15:58:36'!
moverseHaciaAdelante: marsRover

	^marsRover moverseAAdelanteHaciaElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:10:54'!
moverseHaciaAtras: marsRover

	^marsRover moverseAAtrasHaciaElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:26:52'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElNorte.! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:17:01'!
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

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:44:09'!
moverseHaciaAdelante: marsRover


	marsRover moverseAAdelanteHaciaElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:44:26'!
moverseHaciaAtras: marsRover


	marsRover moverseAAtrasHaciaElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:44:44'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElOeste.! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'belen 11/16/2021 16:45:02'!
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

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:02:43'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElSur.
	! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:02:57'!
moverseHaciaAtras: marsRover


	marsRover moverseAAtrasHaciaElSur.! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:03:21'!
rotarHaciaLaDerecha: marsRovers

	marsRovers rotarHaciaLaDerechaDesdeElSur.! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'belen 11/16/2021 17:03:37'!
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


!MovimientoDeMarsRover methodsFor: 'testing - privado' stamp: 'belen 11/18/2021 16:05:37'!
elComandoEsValido: comando
 	
	
	^ (#($f, $b, $l, $r) includes: comando).! !


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


!MovimientoDeMarsRover methodsFor: 'inicializacion' stamp: 'belen 11/18/2021 16:13:03'!
inicializarCon: puntoInicial YConPuntoCardinal: unPuntoCardinal
	
	posicion := puntoInicial. 
	
	
	direccionDelMovimiento := DireccionesDeMovimientoDeMarsRover crearDireccionDeMovimientoAdecuadaParaMarsRover: unPuntoCardinal.
	! !


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

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'Melany 11/17/2021 13:25:14'!
movimiento: cadena

	cadena do: [:comando |
		
		(self elComandoEsValido: comando) ifFalse: [ self error: MovimientoDeMarsRover errorComandoInvalido].
		
		(comando = $f) ifTrue:[direccionDelMovimiento moverseHaciaAdelante: self].
		
		(comando = $b) ifTrue:[direccionDelMovimiento moverseHaciaAtras: self].
		
		(comando = $l) ifTrue:[direccionDelMovimiento rotarHaciaLaIzquierda:self].
		
		(comando = $r) ifTrue:[direccionDelMovimiento rotarHaciaLaDerecha: self].
	]
! !

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
