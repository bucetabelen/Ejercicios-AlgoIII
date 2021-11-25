!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TestXXX category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestXXX
	instanceVariableNames: 'anOriginAccount aDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 15:00:40'!
test01TransferBetweenAccountsIsPossible

	

	Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.! !

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 14:56:53'!
test02TransferKnowsAmountOfTransaction

	|transfer|
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.
	
	self assert: 100*peso equals: transfer value. 
! !

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 14:57:09'!
test03TransferDepositLegKnowsTransferWithdrawLeg
	
	|transfer  |
	
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: transfer withdrawLeg equals: (transfer depositLeg) withdrawLeg . 
! !

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 14:57:24'!
test04TransferWithdrawLegKnowsTransferDepositLeg
	
	|transfer  |
	

	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: transfer depositLeg equals: (transfer withdrawLeg ) depositLeg. 
! !

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 14:58:14'!
test05TransferBetweenSameAccountIsNotPossible


	self 
		
		should: [Transfer from: anOriginAccount to: anOriginAccount for: 100*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorSameAccounts ].
		
		
		! !

!TestXXX methodsFor: 'tests' stamp: 'belen 11/25/2021 14:58:08'!
test06TransferAmountCanNotBeZero


	self 
	
		should: [Transfer from: anOriginAccount to: aDestinationAccount for: 0*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorAmountIsCero].
		
		
		! !


!TestXXX methodsFor: 'setUp' stamp: 'belen 11/25/2021 15:00:49'!
setUp


	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
	
	! !


!classDefinition: #TestYYY category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestYYY
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:17:06'!
test01PortfolioHaveZeroBalanceWhenCreated

	| portfolio unaCuenta otraCuenta|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.

	
	self assert: 0*peso equals: portfolio balance.! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:25:00'!
test02PortfolioIncresesWhenAccountsHaveBalance

	| portfolio unaCuenta otraCuenta o|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	
	
	Deposit register: 100*peso on: unaCuenta.
	Deposit register: 200*peso on: otraCuenta.
	
	

	portfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.

	
	self assert: 300*peso equals: portfolio balance.
	
	
	
! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:55:37'!
test03PortfolioRegisterTransactions

	| portfolio unaCuenta otraCuenta deposit withdraw a|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	a := ReceptiveAccount new.
	
	deposit := Deposit register: 100*peso on: unaCuenta.
	withdraw := Withdraw register: 50*peso on: a . 

	portfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	
	
	self assert: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw ).

	
	
! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:29:28'!
test04PortfolioKnowsItsTransactions

	| portfolio unaCuenta otraCuenta a|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	a := ReceptiveAccount new.
	
	Deposit register: 100*peso on: unaCuenta.
	Withdraw register: 50*peso on: unaCuenta. 

	portfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	self assert: 2 equals: (portfolio transaccionesDeLaCuenta: unaCuenta) size.
	
	

"	
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit)."
! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:21:02'!
test05PortfolioWithPortfolioAndAccountHaveZeroBalanceWhenCreated

	| portfolio unaCuenta otraCuenta otroPortfolio cuenta|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	cuenta := ReceptiveAccount new.
	portfolio := Portfolio new.
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: cuenta.

	
	self assert: 0*peso equals: otroPortfolio balance.! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:20:22'!
test06PortfolioWithPortfolioAndAccountIncresesWhenAccountsHaveBalance

	
	| portfolio unaCuenta otraCuenta otroPortfolio cuenta|
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	cuenta := ReceptiveAccount new.
	portfolio := Portfolio new.
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: cuenta.
	
	Deposit register: 100*peso on: unaCuenta.
	Deposit register: 200*peso on: otraCuenta.
	Deposit register: 100*peso on: cuenta.
	

	
	self assert: 400*peso equals: otroPortfolio balance.
	
	
	
! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:28:34'!
test07PortfolioWithPortfolioAndAccountIncresesKnowsRegisterTransactions

	
	| portfolio unaCuenta otraCuenta otroPortfolio cuenta deposit withdraw |
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	cuenta := ReceptiveAccount new.
	portfolio := Portfolio new.
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: cuenta.
	
	deposit := Deposit register: 100*peso on: unaCuenta.
	"withdraw:= Withdraw register: 200*peso on: otraCuenta."
	
	withdraw := Withdraw for: 100*peso.
	self assert: (otroPortfolio hasRegistered: deposit).
	self deny: (otroPortfolio hasRegistered: withdraw ).

	
	
	
! !

!TestYYY methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:31:56'!
test08PortfolioWithPortfolioAndAccountIncresesKnowsRegisterTransactions

	
	| portfolio unaCuenta otraCuenta otroPortfolio cuenta deposit withdraw |
	
	
	unaCuenta := ReceptiveAccount new.
	otraCuenta := ReceptiveAccount new.
	cuenta := ReceptiveAccount new.
	portfolio := Portfolio new.
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: unaCuenta. 
	portfolio agruparCuenta: otraCuenta.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: cuenta.
	
	Deposit register: 100*peso on: unaCuenta.
	Withdraw register: 200*peso on: unaCuenta.
	
	self assert: 2 equals: (portfolio transaccionesDeLaCuenta: unaCuenta) size.
	
		! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:26:15'!
updateBalance: balance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:26:56'!
updateBalance: balance

	^balance + self value.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:42:36'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 13:37:02'!
initializeFor: aTransfer

	transfer := aTransfer! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 13:40:40'!
registerOn: account

	
	account register: self.
		
	^ self.! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 13:37:50'!
value

	^transfer value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 13:34:24'!
of: aTransfer on: anOriginAccount

	
	^self new initializeFor: aTransfer. 
! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:27:16'!
updateBalance: balance

	^balance + self value.! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:23:48'!
withdrawLeg

	^transfer withdrawLeg.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:24:07'!
depositLeg

	^transfer depositLeg.! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:27:33'!
updateBalance: balance

	^balance + self value negated.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'belen 11/25/2021 14:11:59'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:27:42'!
updateBalance: balance

	^balance + self value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:42:40'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:13:32'!
agruparCuenta: anAccount
		
		
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:16:23'!
balance
	
	^accounts sum:[:acc | acc balance]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:26:28'!
hasRegistered: aDeposit 
	
	|bool|
	accounts do:[ :account | (account hasRegistered: aDeposit)ifTrue:[^account hasRegistered: aDeposit]ifFalse:[bool := false]].
	
	^bool.
	
	
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:13:48'!
initialize

	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:10:06'!
transaccionesDeLaCuenta: unaCuenta
	
	|cuenta|
	accounts do:[:account | (account == unaCuenta) ifTrue:[cuenta := account] ].
	
	^cuenta transactions. ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'belen 11/25/2021 14:29:09'!
balance

	|balanceParcial|
	
	balanceParcial := 0.

	^transactions sum: [ :aTransaction |
		
		 aTransaction updateBalance: balanceParcial.]
	
	 ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositTransfer withdrawTransfer depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:33:10'!
depositLeg
	^depositLeg ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 16:42:51'!
initializeFor: aValue a: aDepositTransfer a: aWithdrawTransfer
	
	
	value := aValue. 
	depositTransfer := aDepositTransfer.
	withdrawTransfer := aWithdrawTransfer.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:30:51'!
initializeWith: anAmountTransfer WithdrawLeg: transferWithdrawLeg DepositLeg: transferDepositLeg.
	 
	
	value := anAmountTransfer. 
	depositLeg := transferDepositLeg.
	withdrawLeg := transferWithdrawLeg.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 20:46:49'!
value

	^value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:33:00'!
withdrawLeg

	^withdrawLeg. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'tranfers'!

!Transfer class methodsFor: 'operations' stamp: 'belen 11/25/2021 14:39:55'!
from: anOriginAccount to: aDestinationAccount for: anAmountTransfer 


	| transfer transferWithdrawLeg transferDepositLeg |
	
	
	self assert: anAmountTransfer canBeTransferedTo: aDestinationAccount from: anOriginAccount. 
	
	transfer := self new.
	
	
	transferWithdrawLeg := TransferWithdrawLeg of: transfer on: anOriginAccount.
	transferWithdrawLeg registerOn: anOriginAccount. 
	
	transferDepositLeg := TransferDepositLeg of: transfer on: aDestinationAccount.
	transferDepositLeg registerOn: aDestinationAccount . 
	
	^transfer initializeWith: anAmountTransfer WithdrawLeg: transferWithdrawLeg DepositLeg: transferDepositLeg.
	 
	
	 ! !


!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:51:40'!
assert: anAmountTransfer canBeTransferedTo: aDestinationAccount from: anOriginAccount


	(aDestinationAccount == anOriginAccount) ifTrue:[^self error:Transfer errorSameAccounts].
	(anAmountTransfer = 0) ifTrue: [^self error: Transfer errorAmountIsCero].! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:50:57'!
errorAmountIsCero

	^'no se puede amount'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:50:46'!
errorSameAccounts

	^'no se puede'.! !
