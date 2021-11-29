!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'accountA accountB portfolio accountC'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'AclaracionSobreElTDD' stamp: 'BELEN 11/29/2021 15:59:48'!
AclaracionSobreTDD

"Aclaración sobre el desarrollo de TDD. 

Empezamos escribiendo los tests 'simples' acorde a los requerimientos. Definimos portfolio simple como aquel portfolio cuyo contenido son sólo Receptives Accounts. Por ejemplo, primero comenzamos haciendo el test donde se testea el correcto agregado de cuentas a un portfolio y así siguiendo según los requerimientos. En principio, estos tests fueron desarrollados pensando en portfolios 'simples'.  Luego, seguimos por el testeo de los portfolios compuestos, aquellos compuestos por Receptives Accounts y Portfolios. Este testeo consistió de nuevo en testear que todos los requerimientos se efectuen correctamente para este 'tipo' de portfolios (compuestos). 

Una vez terminado esto, reflexionando nos dimos cuenta de que en realidad, no había tal distinción entre portfolios simples y compuestos, sino que simplemente teniamos portfolios que podian contener Receptives Accounts y/o Portfolios. A su vez, el testeo de los tests era entonces redundante pues tanto para testear un portfolio simple como para testear un portfolio compuesto, utilizabamos el mismo formato de test (según el requerimiento que buscabámos testear). Luego, decidimos refactorizar los tests y dejar sólo los tests que probaban en general los requerimientos (es decir, los que instanciaban un portfolio con Receptives Accounts y Portfolio). 
Esta nota la hacemos porque queremos dejar en claro que el resultado final de los tests no es el camino original que tomamos, como explicamos en el primer párrafo, el desarrollo de TDD lo hicimos en principio pensando para un portfolio simple, luego para un portfolio compuesto. Es por ello que también para mayor claridad dejamos como 'notasTestsQueQuedaronAfuera' los tests originales que testeaban portfolios simples, donde se podrá ver claramente que su formato es idéntico a los de los tests que finalmente dejamos."! !


!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:00:19'!
test01PortfolioHaveZeroBalanceWhenCreated

	"Leer AclaracionSobreElTDD"
	"Aclaracion: NOTAStest01... contiene la implementación original de este método" 
	
	portfolio := self addAccountsOnPortfolio. 
	
	self assert: 0*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:45:13'!
test02PortfolioHasBalanceAsSumOfEachCompositedAccounts 
	
	"Leer AclaracionSobreElTDD"
	"Aclaracion: NOTAStest02... contiene la implementación original de este método" 
	
	Deposit register: 100*peso on: accountA .
	Withdraw register: 200*peso on: accountB .
	
	
	
 	portfolio := self addAccountsOnPortfolio. 
	
	self assert: -100*peso equals: portfolio balance.
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:45:09'!
test03PortfolioKnowsRegisteredTransactions
	
	"Leer AclaracionSobreElTDD"
	"Aclaracion: NOTAStest03... contiene la implementación original de este método" 

	| deposit withdraw|

	
	
	deposit := Deposit register: 100*peso on: accountA .
	withdraw := Withdraw register: 50*peso on: accountB. 


	portfolio := self addAccountsOnPortfolio. 
	
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw ).

	
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:45:05'!
test04PortfolioDoesNotKnowNotRegisteredTransactions

	"Leer AclaracionSobreElTDD"
	"Aclaracion: NOTAStest04... contiene la implementación original de este método" 
	
	|deposit withdraw|

	
	deposit := Deposit for:100*peso.
	withdraw := Withdraw for: 50*peso. 


	portfolio := self addAccountsOnPortfolio. 
	
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw ).

	
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:45:00'!
test05PortfolioKnowsItsTransactions
	
	"Leer AclaracionSobreElTDD"
	"Aclaracion: NOTAStest05... contiene la implementación original de este método" 

	portfolio := self addAccountsOnPortfolio.
	
	Deposit register: 100*peso on: accountA .
	Withdraw register: 50*peso on: accountA . 

	
	
	self assert: 2 equals: (portfolio transactions) size.! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:42:49'!
test06PortfolioCanNotAddSameAccountTwice

	
	portfolio addAccount: accountA. 
	
	self should: [portfolio addAccount: accountA.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio errorAccountCanNotBeDuplicated ].
		
	
		! !

!PortfolioTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:42:56'!
test07PortfolioCanNotAddItsSelf

	
	self should: [portfolio addAccount: portfolio.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio errorPortfolioCanNotAddItself].
		
	
		! !


!PortfolioTest methodsFor: 'operations' stamp: 'BELEN 11/29/2021 16:07:12'!
addAccountsOnPortfolio

	
	| unPortfolio auxiliarPorfolio|
	
	
	unPortfolio := Portfolio new.
	auxiliarPorfolio := Portfolio new.
	

	auxiliarPorfolio addAccount: accountA. 
	
	
	unPortfolio addAccount: auxiliarPorfolio. 
	unPortfolio addAccount: accountB.
	
	^unPortfolio. 
		! !

!PortfolioTest methodsFor: 'operations' stamp: 'BELEN 11/29/2021 16:05:53'!
generateTransactionsOnAccounts

	
	Deposit register: 100*peso on: accountA.
	Withdraw register: 200*peso on: accountA.
	Deposit register: 100*peso on: accountB.! !


!PortfolioTest methodsFor: 'notasTestsQueQuedaronAfuera' stamp: 'BELEN 11/28/2021 18:21:45'!
NOTAStest01PortfolioHaveZeroBalanceWhenCreated
	
	portfolio addAccount: accountA.
	portfolio addAccount: accountB.
	
	self assert: 0*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'notasTestsQueQuedaronAfuera' stamp: 'BELEN 11/29/2021 16:45:47'!
NOTAStest02PortfolioHasBalanceAsSumOfEachCompositedAccounts 
	
	
	
	Deposit register: 100*peso on: accountA .
	Withdraw register: 200*peso on: accountB .
	
	
	portfolio addAccount: accountA.
	portfolio addAccount: accountB.
	
	self assert: -100*peso equals: portfolio balance.
	
	
	! !

!PortfolioTest methodsFor: 'notasTestsQueQuedaronAfuera' stamp: 'BELEN 11/29/2021 16:44:02'!
NOTAStest03PortfolioKnowsRegisteredTransactions

	| deposit withdraw|

	
	
	deposit := Deposit register: 100*peso on: accountA .
	withdraw := Withdraw register: 50*peso on: accountB. 


	
	portfolio addAccount: accountA . 
	portfolio addAccount: accountB .
	
	
	
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw ).

	
	
! !

!PortfolioTest methodsFor: 'notasTestsQueQuedaronAfuera' stamp: 'BELEN 11/29/2021 16:44:08'!
NOTAStest04PortfolioDoesNotKnowNotRegisteredTransactions

	|deposit withdraw|

	
	deposit := Deposit for:100*peso.
	withdraw := Withdraw for: 50*peso. 


	portfolio addAccount: accountA . 
	portfolio addAccount: accountB .
	
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw ).

	
	
! !

!PortfolioTest methodsFor: 'notasTestsQueQuedaronAfuera' stamp: 'BELEN 11/29/2021 16:44:14'!
NOTAStest05PortfolioKnowsItsTransactions

	portfolio addAccount: accountA.
	portfolio addAccount: accountB.
	

	Deposit register: 100*peso on: accountA .
	Withdraw register: 50*peso on: accountA . 

	
	
	self assert: 2 equals: (portfolio transactions) size.! !


!PortfolioTest methodsFor: 'setUp' stamp: 'belen 11/26/2021 14:55:38'!
setUp

	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	accountC := ReceptiveAccount new.
	
	portfolio := Portfolio new.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'BELEN 11/27/2021 13:05:56'!
setUp

	account := ReceptiveAccount new.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:06:11'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	
	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:06:23'!
test02DepositIncreasesBalanceOnTransactionValue 


	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:06:32'!
test03WithdrawDecreasesBalanceOnTransactionValue 


	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:24:08'!
test04WithdrawValueMustBePositive 

	|  withdrawValue |

	withdrawValue := -50 * peso.

	self should: [Withdraw register: withdrawValue on: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: AccountTransaction errorAmountCanNotBeNegative ].
		
	
		
	
	"self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) "
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:44:38'!
test05DepositValueMustBePositive 

	|  depositValue |

	depositValue := -50 * peso.

	self should: [Withdraw register: depositValue on: account]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: AccountTransaction errorAmountCanNotBeNegative ].
		
	
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:28:03'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	|  deposit withdraw |
	
	
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:08:22'!
test07AccountKnowsItsTransactions 

	|  deposit |
	
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:28:24'!
test08ReceptiveAccountDoNotKnowNotRegisteredTransactions

	|  deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:01:28'!
test01TransferBetweenAccountsIsPossible

	

	Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.! !

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:01:57'!
test02TransferKnowsAmountOfTransaction

	|transfer|
	
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: 100*peso.
	
	
	self assert: anOriginAccount balance equals: -100*peso.
	self assert: aDestinationAccount balance equals: 100*peso.
	
	self assert: 100*peso equals: transfer value. 
! !

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/29/2021 16:39:17'!
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

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 12:57:35'!
test05TransferBetweenSameAccountIsNotPossible


	self 
		
		should: [Transfer from: anOriginAccount to: anOriginAccount for: 100*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorTransferBetweenSameAccountIsNotPossible ].
		
		
		! !

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 12:59:35'!
test06TransferAmountCanNotBeZero


	self 
	
		should: [Transfer from: anOriginAccount to: aDestinationAccount for: 0*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorAmountIsInvalid ].
		
		
		! !

!TransferTest methodsFor: 'tests' stamp: 'BELEN 11/27/2021 13:00:11'!
test07TransferAmountCanNotBeNegative


	self 
	
		should: [Transfer from: anOriginAccount to: aDestinationAccount for: -100*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transfer errorAmountIsInvalid].
		
		
		! !


!TransferTest methodsFor: 'setUp' stamp: 'belen 11/25/2021 15:00:49'!
setUp


	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'BELEN 11/28/2021 18:41:18'!
initialize

	self subclassResponsibility. ! !


!Account methodsFor: 'main protocol' stamp: 'BELEN 11/28/2021 18:30:36'!
balance

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'BELEN 11/28/2021 18:32:27'!
hasRegistered: aTransaction

	self subclassResponsibility. ! !

!Account methodsFor: 'main protocol' stamp: 'BELEN 11/28/2021 18:31:58'!
transactions

	self subclassResponsibility. ! !


!Account methodsFor: 'operations' stamp: 'BELEN 11/28/2021 18:31:43'!
saveTransactionsHere: listTransactions

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'assert - private' stamp: 'BELEN 11/27/2021 15:13:40'!
assertcanBeAddedToAccounts: anAccount

	(accounts includes: anAccount) ifTrue: [self error: Portfolio errorAccountCanNotBeDuplicated].
	
	(self == anAccount) ifTrue: [ ^ self error: Portfolio errorPortfolioCanNotAddItself].! !


!Portfolio methodsFor: 'main protocol' stamp: 'BELEN 11/27/2021 13:14:30'!
balance
	
	^accounts sum:[:account | account balance]! !

!Portfolio methodsFor: 'main protocol' stamp: 'BELEN 11/29/2021 15:17:33'!
hasRegistered: aTransaction 
	
	|bool|
	
	accounts do:[ :account | (account hasRegistered: aTransaction)ifTrue:[^true]ifFalse:[bool := false]].
	
	^bool.
	
	
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'Melany 11/26/2021 17:35:56'!
transactions
	
	|listTransaction|
	
	listTransaction  := OrderedCollection new.
	accounts do:[ :account | account saveTransactionsHere: listTransaction ].
	
	^listTransaction copy.! !


!Portfolio methodsFor: 'operations' stamp: 'BELEN 11/27/2021 13:16:18'!
addAccount: anAccount
		
	self assertcanBeAddedToAccounts: anAccount.
	accounts add: anAccount.! !

!Portfolio methodsFor: 'operations' stamp: 'Melany 11/26/2021 17:37:44'!
saveTransactionsHere: listTransactions

	accounts do: [ :transactions | transactions saveTransactionsHere: listTransactions ].
	
	^ listTransactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'BELEN 11/27/2021 13:11:41'!
initialize

	accounts := OrderedCollection new.
	

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'BELEN 11/27/2021 15:13:03'!
errorAccountCanNotBeDuplicated
	
	^ 'Cuenta repetida en el portfolio'.! !

!Portfolio class methodsFor: 'error' stamp: 'BELEN 11/27/2021 15:13:40'!
errorPortfolioCanNotAddItself

	^'No se puede agregar el portfolio a si mismo'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'operations' stamp: 'Melany 11/26/2021 17:33:36'!
saveTransactionsHere: listTransactions

	transactions do: [: transaction | listTransactions add: transaction].
	
	^ listTransactions.

	! !


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


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'operations' stamp: 'belen 11/25/2021 14:26:15'!
updateBalance: balance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'error' stamp: 'BELEN 11/29/2021 16:19:45'!
errorAmountCanNotBeNegative

	^'Error el monto no puede ser negativo'! !


!AccountTransaction class methodsFor: 'assert - private' stamp: 'BELEN 11/29/2021 16:26:44'!
assertCanDoTransactionWith: aValue


	(aValue < 0) ifTrue:[^self error: AccountTransaction errorAmountCanNotBeNegative]! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'BELEN 11/29/2021 15:20:21'!
initializeFor: aValue

	amount := aValue ! !


!Deposit methodsFor: 'value' stamp: 'BELEN 11/29/2021 15:20:21'!
value

	^ amount! !


!Deposit methodsFor: 'operations' stamp: 'belen 11/25/2021 14:26:56'!
updateBalance: balance

	^balance + self value.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'BELEN 11/29/2021 16:27:40'!
for: aValue
	
	self assertCanDoTransactionWith: aValue.
	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'belen 11/24/2021 17:42:36'!
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

!TransferLeg methodsFor: 'value' stamp: 'belen 11/25/2021 13:37:50'!
value

	^transfer value.! !


!TransferLeg methodsFor: 'initialization' stamp: 'belen 11/25/2021 13:37:02'!
initializeFor: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'BELEN 11/27/2021 12:50:54'!
for: aTransfer


	^self new initializeFor: aTransfer.! !

!TransferLeg class methodsFor: 'instance creation' stamp: 'BELEN 11/27/2021 12:51:01'!
of: aTransfer on: anAccount

	|transfer|
	
	transfer := self for: aTransfer. 
	
	anAccount register: transfer.
	
	^transfer.
! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'accesing' stamp: 'belen 11/24/2021 17:23:48'!
withdrawLeg

	^transfer withdrawLeg.! !


!TransferDepositLeg methodsFor: 'operations' stamp: 'belen 11/25/2021 14:27:16'!
updateBalance: balance

	^balance + self value.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'accesing' stamp: 'belen 11/24/2021 17:24:07'!
depositLeg

	^transfer depositLeg.! !


!TransferWithdrawLeg methodsFor: 'operations' stamp: 'belen 11/25/2021 14:27:33'!
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


!Withdraw methodsFor: 'operations' stamp: 'belen 11/25/2021 14:27:42'!
updateBalance: balance

	^balance + self value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'BELEN 11/29/2021 16:27:13'!
for: aValue
	
	self assertCanDoTransactionWith: aValue.
	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'BELEN 11/29/2021 16:22:11'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'accesing' stamp: 'belen 11/24/2021 17:33:10'!
depositLeg
	^depositLeg ! !

!Transfer methodsFor: 'accesing' stamp: 'belen 11/24/2021 17:33:00'!
withdrawLeg

	^withdrawLeg. ! !


!Transfer methodsFor: 'initialization' stamp: 'BELEN 11/28/2021 18:27:34'!
initializeWith: anAmountTransfer WithdrawLeg: transferWithdrawLeg DepositLeg: transferDepositLeg.
	 
	
	amount := anAmountTransfer. 
	depositLeg := transferDepositLeg.
	withdrawLeg := transferWithdrawLeg.! !


!Transfer methodsFor: 'value' stamp: 'BELEN 11/28/2021 18:27:34'!
value

	^amount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'tranfers'!

!Transfer class methodsFor: 'instance creation' stamp: 'BELEN 11/27/2021 12:53:10'!
from: anOriginAccount to: aDestinationAccount for: anAmountTransfer 


	| transfer transferWithdrawLeg transferDepositLeg |
	
	
	self assert: anAmountTransfer canBeTransferedTo: aDestinationAccount from: anOriginAccount. 
	
	transfer := self new.
	
	
	transferWithdrawLeg := TransferWithdrawLeg of: transfer on: anOriginAccount.
	
	
	transferDepositLeg := TransferDepositLeg of: transfer on: aDestinationAccount.
	
	
	^transfer initializeWith: anAmountTransfer WithdrawLeg: transferWithdrawLeg DepositLeg: transferDepositLeg.
	 
	
	 ! !


!Transfer class methodsFor: 'assert - private' stamp: 'BELEN 11/27/2021 12:59:57'!
assert: anAmountTransfer canBeTransferedTo: aDestinationAccount from: anOriginAccount


	(aDestinationAccount == anOriginAccount) ifTrue:[^self error:Transfer errorTransferBetweenSameAccountIsNotPossible].
	(anAmountTransfer <= 0) ifTrue: [^self error: Transfer errorAmountIsInvalid ].
	! !


!Transfer class methodsFor: 'error' stamp: 'BELEN 11/27/2021 12:59:07'!
errorAmountIsInvalid

	^'El monto a transferir es inválido'.! !

!Transfer class methodsFor: 'error' stamp: 'BELEN 11/27/2021 12:57:54'!
errorTransferBetweenSameAccountIsNotPossible

	^'No se puede realizar transferencias entre la misma cuenta'.! !
