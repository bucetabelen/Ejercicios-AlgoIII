!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'accountA accountB portfolio accountC'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 14:55:38'!
setUp

	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	accountC := ReceptiveAccount new.
	
	portfolio := Portfolio new.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 14:48:22'!
test01PortfolioHaveZeroBalanceWhenCreated

	
	portfolio agruparCuenta: accountA. 
	portfolio agruparCuenta: accountB.

	
	self assert: 0*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 14:49:20'!
test02PortfolioIncresesWhenAccountsHaveBalance


	
	
	Deposit register: 100*peso on: accountA .
	Deposit register: 200*peso on: accountB .
	
	

	
	portfolio agruparCuenta: accountA . 
	portfolio agruparCuenta: accountB .

	
	self assert: 300*peso equals: portfolio balance.
	
	
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 14:52:07'!
test03PortfolioRegisterTransactions

	| anotherAccount deposit withdraw|

	anotherAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100*peso on: accountA .
	withdraw := Withdraw register: 50*peso on: anotherAccount. 


	portfolio agruparCuenta: accountA . 
	portfolio agruparCuenta: accountB .
	
	
	
	self assert: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw ).

	
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:01:20'!
test04PortfolioKnowsItsTransactions


	portfolio agruparCuenta: accountA . 
	portfolio agruparCuenta: accountB .
	
	Deposit register: 100*peso on: accountA .
	Withdraw register: 50*peso on: accountA . 

	
	
	self assert: 2 equals: (portfolio transactions) size.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 14:56:09'!
test05PortfolioWithPortfolioAndAccountHaveZeroBalanceWhenCreated

	|otroPortfolio|
	
	
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: accountA. 
	portfolio agruparCuenta: accountB.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: accountC.

	
	self assert: 0*peso equals: otroPortfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'belen 11/26/2021 15:03:58'!
test06PortfolioWithPortfolioAndAccountIncresesWhenAccountsHaveBalance

	
	|otroPortfolio|
	
	
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: accountA. 
	portfolio agruparCuenta: accountB.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: accountC.
	
	Deposit register: 100*peso on: accountA.
	Deposit register: 200*peso on: accountB.
	Deposit register: 100*peso on: accountC.
	

	
	self assert: 400*peso equals: otroPortfolio balance.
	
	
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:01:28'!
test07PortfolioWithPortfolioAndAccountIncresesKnowsRegisterTransactions

	
	| otroPortfolio deposit withdraw |
	
	
	
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: accountA. 
	portfolio agruparCuenta: accountB.
	
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: accountC.
	
	deposit := Deposit register: 100*peso on: accountA.
	
	withdraw := Withdraw for: 100*peso.
	
	self assert: (otroPortfolio hasRegistered: deposit).
	self deny: (otroPortfolio hasRegistered: withdraw ).

	
	
	
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:44:31'!
test08PortfolioWithPortfolioAndAccountIncresesKnowsRegisterTransactions

	
	| otroPortfolio portfolio3 accountD|
	
	
	otroPortfolio := Portfolio new.
	
	portfolio agruparCuenta: accountA. 
	portfolio agruparCuenta: accountC.
	otroPortfolio agruparCuenta: portfolio. 
	otroPortfolio agruparCuenta: accountB.
	portfolio3 := Portfolio new.
	accountD :=  ReceptiveAccount new.
	portfolio3 agruparCuenta: accountD.
	otroPortfolio agruparCuenta: portfolio3.
	
	Deposit register: 100*peso on: accountA.
	Withdraw register: 200*peso on: accountC.

	Deposit register: 100*peso on: accountB.
	
	Deposit register: 200*peso on: accountD.
	Deposit register: 200*peso on: accountD.
	Withdraw register: 200*peso on: accountD.
	
	
	self assert: 6 equals: (otroPortfolio transactions ) size.
	
		! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:49:01'!
test09PortfolioCanNotAddSameAccountTwice

	portfolio agruparCuenta: accountA. 
	
	self should: [portfolio agruparCuenta: accountA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio errorCuentaRepetida ].
		
	
		! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:51:26'!
test10punto2

	portfolio agruparCuenta: accountA. 
	
	self should: [portfolio agruparCuenta: accountA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio errorCuentaRepetida ].
		
	
		! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 18:04:11'!
test11PortfolioCanNotAddItsSelf
	
	self should: [portfolio agruparCuenta: portfolio.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio errorNoSePuedeAgregarASiMismo].
		
	
		! !


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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 15:00:40'!
test01TransferBetweenAccountsIsPossible

	

	Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.! !

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 14:56:53'!
test02TransferKnowsAmountOfTransaction

	|transfer|
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.
	
	self assert: 100*peso equals: transfer value. 
! !

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 14:57:09'!
test03TransferDepositLegKnowsTransferWithdrawLeg
	
	|transfer  |
	
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: transfer withdrawLeg equals: (transfer depositLeg) withdrawLeg . 
! !

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 14:57:24'!
test04TransferWithdrawLegKnowsTransferDepositLeg
	
	|transfer  |
	

	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: transfer depositLeg equals: (transfer withdrawLeg ) depositLeg. 
! !

!TransferTest methodsFor: 'tests' stamp: 'Melany 11/26/2021 17:48:07'!
test05TransferBetweenSameAccountIsNotPossible


	self 
		
		should: [Transfer from: anOriginAccount to: anOriginAccount for: 100*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorSameAccounts ].
		
		
		! !

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 14:58:08'!
test06TransferAmountCanNotBeZero


	self 
	
		should: [Transfer from: anOriginAccount to: aDestinationAccount for: 0*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorAmountIsCero].
		
		
		! !

!TransferTest methodsFor: 'tests' stamp: 'belen 11/25/2021 19:30:21'!
test07TransferAmountCanNotBeNegative


	self 
	
		should: [Transfer from: anOriginAccount to: aDestinationAccount for: -100*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorAmountIsNegative].
		
		
		! !


!TransferTest methodsFor: 'setUp' stamp: 'belen 11/25/2021 15:00:49'!
setUp


	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
	
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
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'belen 11/26/2021 15:23:56'!
initializeFor: aValue

	amount := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'belen 11/26/2021 15:23:56'!
value

	^ amount! !


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
	instanceVariableNames: 'accounts transactionsList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:13:11'!
agruparCuenta: anAccount
		
	self assertcanBeAddedToAccounts: anAccount.
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 18:03:43'!
assertcanBeAddedToAccounts: anAccount

	(accounts includes: anAccount) ifTrue: [self error: Portfolio errorCuentaRepetida].
	
	(self == anAccount) ifTrue: [ ^ self error: Portfolio errorNoSePuedeAgregarASiMismo].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 15:16:23'!
balance
	
	^accounts sum:[:acc | acc balance]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 16:26:28'!
hasRegistered: aDeposit 
	
	|bool|
	accounts do:[ :account | (account hasRegistered: aDeposit)ifTrue:[^account hasRegistered: aDeposit]ifFalse:[bool := false]].
	
	^bool.
	
	
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 20:42:20'!
initialize

	accounts := OrderedCollection new.
	
	transactionsList := OrderedCollection new.
	
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:37:44'!
saveTransactionsHere: listTransactions

	accounts do: [ :transactions | transactions saveTransactionsHere: listTransactions ].
	
	^ listTransactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:35:56'!
transactions
	
	|listTransaction|
	
	listTransaction  := OrderedCollection new.
	accounts do:[ :account | account saveTransactionsHere: listTransaction ].
	
	^listTransaction copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:14:42'!
errorCuentaRepetida
	
	^ 'Cuenta repetida en el portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:53:49'!
errorNoSePuedeAgregarASiMismo

	^'No se puede agregar el portfolio a si mismo'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'belen 11/25/2021 19:33:17'!
balance

	|balanceParcial|
	
	balanceParcial := 0.

	^transactions sum: [ :aTransaction | aTransaction updateBalance: balanceParcial.] ifEmpty: [ 0 ]! !

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Melany 11/26/2021 17:33:36'!
saveTransactionsHere: listTransactions

	transactions do: [: transaction | listTransactions add: transaction].
	
	^ listTransactions.

	! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositTransfer withdrawTransfer depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'belen 11/24/2021 17:33:10'!
depositLeg
	^depositLeg ! !

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


!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 19:29:47'!
assert: anAmountTransfer canBeTransferedTo: aDestinationAccount from: anOriginAccount


	(aDestinationAccount == anOriginAccount) ifTrue:[^self error:Transfer errorSameAccounts].
	(anAmountTransfer = 0) ifTrue: [^self error: Transfer errorAmountIsCero].
	(anAmountTransfer < 0) ifTrue: [^self error: Transfer errorAmountIsNegative] .! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:50:57'!
errorAmountIsCero

	^'no se puede amount'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 19:29:37'!
errorAmountIsNegative

	^'no se puede amount negativo'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'belen 11/25/2021 14:50:46'!
errorSameAccounts

	^'no se puede'.! !
