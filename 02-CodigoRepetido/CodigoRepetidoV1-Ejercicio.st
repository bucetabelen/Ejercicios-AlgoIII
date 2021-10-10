!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:30:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	| customerBook |
	customerBook := CustomerBook new.
	
	
	self assert: (self actionToCustomer: (customerBook addCustomerNamed: 'John Lennon') TakesLessThan: 50)
	

	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'belen 10/8/2021 17:03:29'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

    | customerBook  paulMcCartney |

    customerBook := CustomerBook new.
    paulMcCartney := 'Paul McCartney'.

    customerBook addCustomerNamed: paulMcCartney.

	
    self assert: (self actionToCustomer:  paulMcCartney TakesLessThan: 100).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:30:53'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	
	self generate: Error in: [customerBook addCustomerNamed: ''] andResponseWith: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:30:59'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.


	self generate: NotFound in: [customerBook removeCustomerNamed: 'Paul McCartney'] andResponseWith: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:28:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self suspendCreatedCustomer:  paulMcCartney from: customerBook. 
	
	self assert: customerBook HasNumberOfActiveCustomers: 0 AndNumberOfSuspendedCustomers: 1 AndNumberOfCustomers: 1.

	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:28:57'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self suspendCreatedCustomer:  paulMcCartney from: customerBook. 
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: customerBook HasNumberOfActiveCustomers: 0 AndNumberOfSuspendedCustomers: 0 AndNumberOfCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:31:19'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	
	self generate: CantSuspend in: [customerBook suspendCustomerNamed: 'Ringo Starr'] andResponseWith: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'mm 10/10/2021 17:31:22'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self suspendCreatedCustomer:  johnLennon from: customerBook. 
	
	
	self generate: CantSuspend in: [customerBook suspendCustomerNamed: johnLennon] andResponseWith: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
! !


!CustomerBookTest methodsFor: 'errorManagement' stamp: 'mm 10/10/2021 17:24:14'!
generate: typeOfError in: method andResponseWith: blockCode

	[ method value.
		
	self fail ]
		on: typeOfError 
		do: blockCode ! !


!CustomerBookTest methodsFor: 'customerManagement' stamp: 'belen 10/8/2021 15:33:05'!
actionToCustomer: customerAction TakesLessThan: time

	| interval |
	

	interval := self calculateTimeOfMethod: (customerAction).
	
	
	^(interval < (time * millisecond)).
	
! !

!CustomerBookTest methodsFor: 'customerManagement' stamp: 'belen 10/8/2021 15:18:45'!
calculateTimeOfMethod: aMethodOfCustomer

	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond .
	aMethodOfCustomer. 
	millisecondsAfterRunning := Time millisecondClockValue * millisecond .
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning)
	
	
	! !

!CustomerBookTest methodsFor: 'customerManagement' stamp: 'mm 10/10/2021 17:27:25'!
suspendCreatedCustomer: aName from: customerBook
	
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'mm 10/10/2021 17:07:36'!
assert: customerBook HasNumberOfActiveCustomers: activeCustomers AndNumberOfSuspendedCustomers: suspendedCustomers AndNumberOfCustomers: customers

	self assert:  activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'belen 10/10/2021 11:19:09'!
addCustomerNamed: aName

	self verifyValidName: aName.
	self verifyCustomerDoesNotExist: aName.
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'mm 10/10/2021 14:34:48'!
removeCustomerNamed: aName 
	
	self verifyCustomerExist: aName.
	self remove: aName. 
! !

!CustomerBook methodsFor: 'customer management' stamp: 'belen 10/10/2021 11:21:50'!
suspendCustomerNamed: aName 

	self verifyCustomerIsActive: aName.

	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'belen 10/10/2021 11:29:34'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]
! !

!CustomerBook methodsFor: 'testing' stamp: 'belen 10/8/2021 16:05:18'!
isActive: aName

	^active includes: aName.
! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'belen 10/10/2021 11:30:00'!
verifyCustomerDoesNotExist: aName

	(self includesCustomerNamed: aName) ifTrue: [ ^self signalCustomerAlreadyExists ].
	! !

!CustomerBook methodsFor: 'testing' stamp: 'belen 10/10/2021 11:31:26'!
verifyCustomerExist: aName

	(self includesCustomerNamed: aName) ifFalse:[^ NotFound signal.].! !

!CustomerBook methodsFor: 'testing' stamp: 'mm 10/10/2021 14:34:12'!
verifyCustomerIsActive: aName
	
	(self isActive: aName) ifFalse: [^ CantSuspend signal].
	! !

!CustomerBook methodsFor: 'testing' stamp: 'belen 10/10/2021 11:15:53'!
verifyValidName: aName

	aName isEmpty ifTrue: [ ^self signalCustomerNameCannotBeEmpty ].
	! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'customer management-private' stamp: 'belen 10/10/2021 11:33:33'!
remove: aName

	aName = (self isActive: aName) ifTrue:[^self removeCustomerNamed: aName from: active ] ifFalse:[^self removeCustomerNamed: aName from: 	suspended].! !

!CustomerBook methodsFor: 'customer management-private' stamp: 'belen 10/8/2021 16:40:15'!
removeCustomerNamed: aName from: typeOfCustomer 

	 
	1 to: typeOfCustomer size do: 
	[ :index |
		aName = (typeOfCustomer at: index)
			ifTrue: [
				typeOfCustomer removeAt: index.
				^ aName 
			] 
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
