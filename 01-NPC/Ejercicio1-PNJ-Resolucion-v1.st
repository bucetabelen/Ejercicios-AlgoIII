!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
DenotativeObject subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: 'frasesParaPrometedores riverwood cantidadDeInteraccionesPorPersonajes frasesParaDesconocidos treborElGuardiaDeSkyrim'!

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 10/1/2021 11:29:26'!
aplicarInfluenciaAlPuebloSobre: unPersonajeJugadorAInteractuar

		
		(self cantidadDeInteraccionesEsMaximaCon: unPersonajeJugadorAInteractuar) ifTrue: [^self influenciarAlPuebloCon: unPersonajeJugadorAInteractuar] 
		ifFalse: [^0.].
		! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 10/1/2021 11:10:51'!
cantidadDeInteraccionesEsMaximaCon: unPersonajeJugadorAInteractuar

		
		| cantidadDeInteracciones |
		cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
		
		(cantidadDeInteracciones = 3)ifTrue:[^true] ifFalse:[^false]

	! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:37:01'!
influenciarAlPuebloCon: unPersonajeJugadorAInteractuar
	
	riverwood actualizarOpinionSobre: unPersonajeJugadorAInteractuar a:'prometedor'.
	self reiniciarHiloDeConversacionCon: unPersonajeJugadorAInteractuar.
	treborElGuardiaDeSkyrim reiniciarHiloDeConversacionCon:  unPersonajeJugadorAInteractuar.
	
! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:26:40'!
obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar

	^cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar ifAbsent:[0].! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'ely 9/28/2021 16:46:03'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar 

	| cantidadDeInteracciones|
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	self actualizarCantidadDeInteraccionesDe: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones.! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:53:27'!
recordarOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar

	
	(riverwood esVistoPorElPuebloComoPrometedor: unPersonajeJugadorAInteractuar ) ifTrue:[ ^0. ] ifFalse: [^self aplicarInfluenciaAlPuebloSobre: unPersonajeJugadorAInteractuar].! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:23:52'!
responderSegunCantidadDeInteraccionesADesconocido: unPersonajeJugadorAInteractuar


	| cantidadDeInteracciones |
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	
	^ frasesParaDesconocidos at: (cantidadDeInteracciones min: frasesParaDesconocidos size)! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:26:56'!
responderSegunCantidadDeInteraccionesAPrometedor: unPersonajeJugadorAInteractuar


	| cantidadDeInteracciones |
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	^ frasesParaPrometedores at: (cantidadDeInteracciones min: frasesParaPrometedores size)! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:50:56'!
responderSegunOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar
	

	(riverwood esVistoPorElPuebloComoPrometedor: unPersonajeJugadorAInteractuar ) ifTrue: [^self responderSegunCantidadDeInteraccionesAPrometedor: unPersonajeJugadorAInteractuar] ifFalse: [^self responderSegunCantidadDeInteraccionesADesconocido:unPersonajeJugadorAInteractuar].

	! !


!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'ely 9/28/2021 16:49:50'!
actualizarCantidadDeInteraccionesDe: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones
	
	
	cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar put: cantidadDeInteracciones +1! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 15:28:29'!
interactuarCon: unPersonajeJugadorAInteractuar
			
			| respuesta |
			self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
			respuesta := self responderSegunOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar.
			self recordarOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar.
			
			^respuesta.! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 15:39:07'!
olvidarInteracciones

	cantidadDeInteraccionesPorPersonajes := Dictionary new
	! !

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 14:39:18'!
reiniciarHiloDeConversacionCon:  unPersonajeJugadorAInteractuar

	^cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar  put: 0.! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'belen 10/4/2021 09:23:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPrometedores := #('Salud aventurero!!' 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme' ).
	riverwood := ElPuebloDeRiverwood.
	cantidadDeInteraccionesPorPersonajes := ((Dictionary new) add: (#Hamilton->1); yourself).
	frasesParaDesconocidos := #('�Est�s enfermo Forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicci�n, ven a verme' ).
	treborElGuardiaDeSkyrim := TreborElGuardiaDeSkyrim.! !


!classDefinition: #ElPuebloDeRiverwood category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
DenotativeObject subclass: #ElPuebloDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElPuebloDeRiverwood class' category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
ElPuebloDeRiverwood class
	instanceVariableNames: 'opinionesSobrePersonajesJugadores'!

!ElPuebloDeRiverwood class methodsFor: 'interacciones - privadas' stamp: 'belen 9/30/2021 15:42:03'!
actualizarOpinionSobre: unPersonajeJugadorAInteractuar a: opinion
	
	opinionesSobrePersonajesJugadores at: unPersonajeJugadorAInteractuar put: opinion.
	
	! !


!ElPuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 15:38:28'!
esVistoPorElPuebloComoPrometedor: unPersonajeJugadorAInteractuar

	| opinion |
	opinion := self obtenerOpinionSobreElPersonajeJugador: unPersonajeJugadorAInteractuar.
	
	 opinion = 'prometedor' ifTrue:[^true] ifFalse: [^false].! !

!ElPuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 15:41:20'!
obtenerOpinionSobreElPersonajeJugador: unPersonajeJugadorAInteractuar

	^opinionesSobrePersonajesJugadores at: unPersonajeJugadorAInteractuar ifAbsent: ['desconocido'].! !

!ElPuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'belen 10/4/2021 09:18:33'!
olvidarCalificaciones


	opinionesSobrePersonajesJugadores := Dictionary new
	! !


!ElPuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'belen 10/4/2021 09:23:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesSobrePersonajesJugadores := ((Dictionary new)).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:09:42'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	 
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Est�s enfermo Forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:10:05'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase

	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:10:26'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase

	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'belen 10/4/2021 09:10:45'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes

	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo Forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo Forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'belen 10/4/2021 09:11:03'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo Forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo Forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'belen 10/4/2021 09:11:34'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'belen 10/4/2021 09:11:53'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase

	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'belen 9/30/2021 14:38:13'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor		
	
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).
	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'belen 9/30/2021 14:20:01'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that:   (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'belen 10/4/2021 09:13:19'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'belen 10/4/2021 09:14:08'!
carolinaLaCurandera

	^ CarolinaLaCurandera

	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ely 9/28/2021 17:47:35'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'belen 9/30/2021 12:03:18'!
riverwood
	^ ElPuebloDeRiverwood! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ely 9/28/2021 17:48:17'!
tirion
	^ #Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ely 9/28/2021 17:48:02'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'belen 9/30/2021 12:14:53'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	
	^ ElPuebloDeRiverwood esVistoPorElPuebloComoPrometedor: unPersonaje.
	
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:20:10'!
hacerQueLaCuranderaOlvideSusInteracciones

	CarolinaLaCurandera olvidarInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:20:04'!
hacerQueRiverwoodOlvideTodasSusCalificaciones

	ElPuebloDeRiverwood olvidarCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:19:52'!
hacerQueRiverwoodVeaPrometedorAHamilton

	ElPuebloDeRiverwood actualizarOpinionSobre: self hamilton a: 'prometedor'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:14:29'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:14:40'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:14:54'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:14:59'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'belen 10/4/2021 09:15:05'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'belen 9/29/2021 12:37:43'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'belen 10/4/2021 09:16:20'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Alg�n problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Alg�n problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'belen 10/4/2021 09:16:38'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'belen 10/4/2021 09:16:59'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estad�a en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 20:52:29'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'belen 9/30/2021 12:03:18'!
riverwood
	^ ElPuebloDeRiverwood! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 21:08:21'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:17:21'!
hacerQueElGuardiaOlvideSusInteracciones
	
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:19:37'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	
	ElPuebloDeRiverwood olvidarCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:17:33'!
hacerQueRiverwoodVeaPrometedorAHamilton
	
	
	ElPuebloDeRiverwood actualizarOpinionSobre: self hamilton a: 'prometedor'. ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'belen 10/4/2021 09:17:39'!
olvidarInteraccionesYOpiniones

	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Resolucion-29-09-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaPrometedores cantidadDeInteraccionesPorPersonajes frasesParaDesconocidos riverwood'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'belen 10/4/2021 09:21:33'!
interactuarCon: unPersonajeJugadorAInteractuar
	
			self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
			
			 ^self responderSegunOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar.
			
			
		! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'belen 9/30/2021 14:56:13'!
olvidarInteracciones
	cantidadDeInteraccionesPorPersonajes := Dictionary new! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/28/2021 12:16:00'!
actualizarCantidadDeInteraccionesDe: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones
	
	
	cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar put: cantidadDeInteracciones +1! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/30/2021 15:37:52'!
obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar

	^cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar ifAbsent:[0].! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/28/2021 15:37:05'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar 

	| cantidadDeInteracciones|
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	self actualizarCantidadDeInteraccionesDe: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones.
	

	
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/30/2021 14:39:28'!
reiniciarHiloDeConversacionCon:  unPersonajeJugadorAInteractuar

	^cantidadDeInteraccionesPorPersonajes at: unPersonajeJugadorAInteractuar  put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/30/2021 15:08:31'!
responderSegunCantidadDeInteraccionesADesconocido: unPersonajeJugadorAInteractuar


	| cantidadDeInteracciones |
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	
	^ frasesParaDesconocidos at: (cantidadDeInteracciones min: frasesParaDesconocidos size)! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/30/2021 15:08:37'!
responderSegunCantidadDeInteraccionesAPrometedor: unPersonajeJugadorAInteractuar


	| cantidadDeInteracciones |
	cantidadDeInteracciones := self obtenerCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	^ frasesParaPrometedores at: (cantidadDeInteracciones min: frasesParaPrometedores size)! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'belen 9/30/2021 15:38:06'!
responderSegunOpinionDelPuebloSobre: unPersonajeJugadorAInteractuar
	
	| estatus |
	estatus := riverwood obtenerOpinionSobreElPersonajeJugador: unPersonajeJugadorAInteractuar. 
		
	(estatus =  'prometedor') ifTrue: [^self responderSegunCantidadDeInteraccionesAPrometedor: unPersonajeJugadorAInteractuar] ifFalse: [^self     responderSegunCantidadDeInteraccionesADesconocido:unPersonajeJugadorAInteractuar].

	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'belen 10/4/2021 09:23:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estad�a en Riverwood' ).
	cantidadDeInteraccionesPorPersonajes := ((Dictionary new) add: (#Hamilton->1); add: (#Tirion->0); yourself).
	frasesParaDesconocidos := #('Hola forastero' '�Todo bien?' '�Alg�n problema?' ).
	riverwood := ElPuebloDeRiverwood.! !

CarolinaLaCurandera initializeAfterFileIn!
ElPuebloDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!