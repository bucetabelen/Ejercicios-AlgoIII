!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'originAccount destinationAccount reportDetail accountSummaryReportOfReceptiveAccount unPortfolio accountSummaryReportOfPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/5/2021 18:18:18'!
test01SummaryOfReceptiveAccountWithNoTransactionsIncludesJustZeroBalance	

	reportDetail add: 'Balance = 0 pesos'.
	
	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/5/2021 21:11:13'!
test02SummaryOfPortfolioWithNoTransactionsIncludesJustZeroBalance	

	reportDetail add: 'Balance = 0 pesos'.
	
	self assert: accountSummaryReportOfPortfolio printReport equals: reportDetail.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:22:27'!
test03SummaryOfReceptiveAccountWithDepositeIncludesJustThatDepositAndBalanceEntries

	
	
	Deposit register: 100*peso on: originAccount.
	
	
	reportDetail add: 'Deposito por 100 pesos'.
	reportDetail add: 'Balance = 100 pesos'.
	
	
	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail.
	


! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:22:35'!
test04SummaryOfPortfolioWithDepositeIncludesJustThatDepositAndBalanceEntries

	
	
	Deposit register: 10*peso on: destinationAccount.
	
	
	reportDetail add: 'Deposito por 10 pesos'.
	reportDetail add: 'Balance = 10 pesos'.
	
	self assert: accountSummaryReportOfPortfolio printReport equals: reportDetail.


! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:24:50'!
test05SummaryOfReceptiveAccountWithWithdrawIncludesJustThatWithdrawAndBalanceEntries


	
	Withdraw register: 50*peso on: originAccount .
	

	reportDetail add: 'Extraccion por 50 pesos'.
	reportDetail add: 'Balance = -50 pesos'.
	
	
	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail .
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:24:57'!
test06SummaryOfPortfolioWithWithdrawIncludesJustThatWithdrawAndBalanceEntries



	Withdraw register: 50*peso on: destinationAccount.
	
	

	reportDetail add: 'Extraccion por 50 pesos'.
	reportDetail add: 'Balance = -50 pesos'.
	
	
	
	self assert: accountSummaryReportOfPortfolio printReport equals: reportDetail .
	

! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:25:08'!
test07SummaryOfReceptiveAccountWithDepositeTransferIncludesJustThatDepositTransferAndBalanceEntries

	
	Transfer amount: 30*peso from: destinationAccount to: originAccount.
	

	reportDetail add: 'Entrada por transferencia de 30 pesos'.
	reportDetail add: 'Balance = 30 pesos'.
	
	
	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail.
	

! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:25:15'!
test08SummaryOfPortfolioWithDepositeTransferIncludesJustThatDepositTransferAndBalanceEntries

	
	Transfer amount: 30*peso from: originAccount to: destinationAccount.
	
	reportDetail add: 'Entrada por transferencia de 30 pesos'.
	reportDetail add: 'Balance = 30 pesos'.
	

	self assert: accountSummaryReportOfPortfolio printReport equals: reportDetail.
	


! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:25:21'!
test09SummaryOfReceptiveAccountWithWithdrawTransferIncludesJustThatWithdrawTransferAndBalanceEntries


	
	Transfer amount: 20*peso from: originAccount to: destinationAccount.

	reportDetail add: 'Salida por transferencia de 20 pesos'.
	reportDetail add: 'Balance = -20 pesos'.
	

	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:25:28'!
test10SummaryOfPortfolioWithWithdrawTransferIncludesJustThatWithdrawTransferAndBalanceEntries

	
	
	Transfer amount: 20*peso from: destinationAccount to: originAccount .

	
	reportDetail add: 'Salida por transferencia de 20 pesos'.
	reportDetail add: 'Balance = -20 pesos'.
	

	self assert: accountSummaryReportOfPortfolio printReport equals: reportDetail.


! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'belen 12/5/2021 21:13:58'!
test11MultiplesTransactionsCanBeIncludeInSummaryOfAccount

	
	Deposit register: 100*peso  on: originAccount.
	Withdraw register: 50*peso on: originAccount. 
	Transfer amount: 20*peso from: originAccount to: destinationAccount.
	Transfer amount: 30*peso from: destinationAccount  to: originAccount . 
	
	
	reportDetail add: 'Deposito por 100 pesos'.
	reportDetail  add: 'Extraccion por 50 pesos'.
	reportDetail add: 'Salida por transferencia de 20 pesos'.
	reportDetail add: 'Entrada por transferencia de 30 pesos'.
	reportDetail add: 'Balance = 60 pesos'.
	
	
	self assert: accountSummaryReportOfReceptiveAccount printReport equals: reportDetail.
	
! !


!AccountSummaryTest methodsFor: 'setUp' stamp: 'belen 12/5/2021 17:15:03'!
setUp

	originAccount := ReceptiveAccount new.
	
	destinationAccount := ReceptiveAccount new.
	
	reportDetail := OrderedCollection new.
	
	unPortfolio := Portfolio with: destinationAccount.
	
	accountSummaryReportOfReceptiveAccount := AccountSummaryVisitor for: originAccount. 
	
	accountSummaryReportOfPortfolio := AccountSummaryVisitor for: unPortfolio.
	
	! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'Melany 12/1/2021 17:33:56'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: 'originAccount destinationAccount reportDetail unPortfolio transferNetForReceptiveAccount transferNetForPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:14:12'!
test01TransferNetOfPortfolioIsZeroWhenThereIsNoTransferTransactions


	self assert: transferNetForPortfolio printReport equals: '0 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:14:20'!
test02TransferNetOfReceptiveAccountIsZeroWhenThereIsNoTransferTransactions


	
	self assert: transferNetForReceptiveAccount printReport equals: '0 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:14:30'!
test03TransferNetOfPortfolioGivesSumOfItTransferTransactions


	
	Transfer amount: 20*peso from: destinationAccount to: originAccount.
	Transfer amount: 30*peso from: originAccount to: destinationAccount.

	
	self assert: transferNetForPortfolio printReport equals: '10 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:14:02'!
test04TransferNetOfReceptiveAccountGivesSumOfItTransferTransactions


	

	
	Transfer amount: 20*peso from: destinationAccount to: originAccount .
	Transfer amount: 30*peso from: originAccount to: destinationAccount .

	
	self assert: transferNetForReceptiveAccount printReport equals: '-10 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/5/2021 17:23:21'!
test05TransferNetShouldBeAPartialBalanceForTransferences


	
	
	
	Transfer amount: 20*peso from: destinationAccount to: originAccount.
	

	self assert: transferNetForReceptiveAccount printReport equals: '20 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/5/2021 17:23:53'!
test06TransferNetShouldBeNegativeWithOnlyWithdrawTransactions


	
	
	Transfer amount: 10*peso from: originAccount to: destinationAccount.
	
	self assert: transferNetForReceptiveAccount printReport equals: '-10 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:12:52'!
test07TransferNetShouldNotConsiderDeposits


	
	Deposit register: 100*peso on: originAccount. 
	
	self assert: transferNetForReceptiveAccount printReport equals: '0 pesos'.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'belen 12/6/2021 10:13:14'!
test08TransferNetShouldNotConsiderWithdraws


	
	Withdraw register: 100*peso on: originAccount. 
	
	self assert: transferNetForReceptiveAccount printReport equals: '0 pesos'.
	! !


!TransferNetTest methodsFor: 'setUp' stamp: 'belen 12/5/2021 17:22:08'!
setUp


	originAccount := ReceptiveAccount new.
	
	destinationAccount := ReceptiveAccount new.
	
	reportDetail := OrderedCollection new.
	
	unPortfolio := Portfolio with: destinationAccount.
	
	transferNetForReceptiveAccount := TranferNetVisitor for: originAccount.
	
	transferNetForPortfolio := TranferNetVisitor for: unPortfolio. 
	
	 
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'belen 12/4/2021 12:07:24'!
accept: aReport

	self subclassResponsibility. ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'belen 12/4/2021 12:35:10'!
accept: aReport


	^ aReport handleAccountAsAPortfolio: self. ! !

!Portfolio methodsFor: 'main protocol' stamp: 'Melany 12/2/2021 21:15:03'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'belen 12/5/2021 12:36:17'!
toAllAccountsDo: aBlock

	
	 accounts do: [:account | aBlock value: account].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'belen 12/4/2021 12:42:54'!
accept: aReport

	^ aReport handleAccountAsAReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'Melany 12/2/2021 21:14:42'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'belen 12/4/2021 13:13:46'!
withTransactionsDo: aBlock

	 transactions do: [:aTransaction | aBlock value: aTransaction].! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:27:06'!
accept: aReport

	self subclassResponsibility. ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:45:41'!
accept: aReport

	^aReport handleTransactionAsDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:56:02'!
accept: aReport

	^ aReport handleTransactionAsDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:52:01'!
accept: aReport

	^ aReport handleTransactionAsWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:50:44'!
accept: aReport

	^ aReport handleTransactionAsWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #ReportVisitor category: 'ServiciosFinancieros-Solucion'!
Object subclass: #ReportVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportVisitor methodsFor: 'manage account' stamp: 'belen 12/5/2021 21:21:09'!
handleAccountAsAPortfolio: aPortfolio
	
	self subclassResponsibility. ! !

!ReportVisitor methodsFor: 'manage account' stamp: 'belen 12/4/2021 12:35:35'!
handleAccountAsAReceptiveAccount: aReceptiveAccount
	
	self subclassResponsibility. ! !


!ReportVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:45:41'!
handleTransactionAsDeposit: aDeposit


	self subclassResponsibility. ! !

!ReportVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:56:30'!
handleTransactionAsDepositLeg: aDepositLeg

	self subclassResponsibility. ! !

!ReportVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:46:56'!
handleTransactionAsWithdraw: aWithdraw

	self subclassResponsibility. ! !

!ReportVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:52:44'!
handleTransactionAsWithdrawLeg: aWithdrawLeg

	self subclassResponsibility. ! !


!ReportVisitor methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:01:36'!
printReport

	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportVisitor class' category: 'ServiciosFinancieros-Solucion'!
ReportVisitor class
	instanceVariableNames: ''!

!ReportVisitor class methodsFor: 'instance creation' stamp: 'belen 12/4/2021 10:54:14'!
for: anAccount

	self subclassResponsibility. ! !


!classDefinition: #AccountSummaryVisitor category: 'ServiciosFinancieros-Solucion'!
ReportVisitor subclass: #AccountSummaryVisitor
	instanceVariableNames: 'account reporter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:45:41'!
handleTransactionAsDeposit: aDeposit


	^'Deposito por ', aDeposit value asString.! !

!AccountSummaryVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:56:55'!
handleTransactionAsDepositLeg: aDepositLeg


	^'Entrada por transferencia de ', aDepositLeg value asString.! !

!AccountSummaryVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:47:02'!
handleTransactionAsWithdraw: aWithdraw

	^'Extraccion por ', aWithdraw value asString.! !

!AccountSummaryVisitor methodsFor: 'manage transactions' stamp: 'belen 12/4/2021 11:53:25'!
handleTransactionAsWithdrawLeg: aWithdrawLeg

	^'Salida por transferencia de ', aWithdrawLeg value asString. ! !


!AccountSummaryVisitor methodsFor: 'main protocol' stamp: 'belen 12/4/2021 11:31:25'!
printReport
	
	
	account accept: self.
	
	reporter add: 'Balance = ', account balance asString. 
	
	^reporter.! !


!AccountSummaryVisitor methodsFor: 'instance creation' stamp: 'belen 12/4/2021 11:24:46'!
initializeFor: anAccount 

	account := anAccount. 
	
	reporter := OrderedCollection new.! !


!AccountSummaryVisitor methodsFor: 'manage account' stamp: 'belen 12/5/2021 12:45:41'!
handleAccountAsAPortfolio: aPortfolio
	
	 aPortfolio toAllAccountsDo: [:acc | (acc accept: self)].
	! !

!AccountSummaryVisitor methodsFor: 'manage account' stamp: 'belen 12/4/2021 12:41:38'!
handleAccountAsAReceptiveAccount: aReceptiveAccount
	
	aReceptiveAccount withTransactionsDo: [:transaction | reporter add: ( transaction accept:self)]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryVisitor class' category: 'ServiciosFinancieros-Solucion'!
AccountSummaryVisitor class
	instanceVariableNames: ''!

!AccountSummaryVisitor class methodsFor: 'instance creation' stamp: 'belen 12/4/2021 11:14:11'!
for: anAccount

	^self new initializeFor: anAccount ! !


!classDefinition: #TranferNetVisitor category: 'ServiciosFinancieros-Solucion'!
ReportVisitor subclass: #TranferNetVisitor
	instanceVariableNames: 'account reportTransferBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TranferNetVisitor methodsFor: 'instance creation' stamp: 'belen 12/5/2021 12:50:34'!
initializeFor: anAccount

	account := anAccount. 
	
	reportTransferBalance := 0*peso.! !


!TranferNetVisitor methodsFor: 'manage account' stamp: 'belen 12/5/2021 12:45:12'!
handleAccountAsAPortfolio: aPortfolio

	aPortfolio toAllAccountsDo: [: anAccount |  (anAccount accept: self)].! !

!TranferNetVisitor methodsFor: 'manage account' stamp: 'belen 12/5/2021 16:41:39'!
handleAccountAsAReceptiveAccount: aReceptiveAccount

	aReceptiveAccount withTransactionsDo: [:transaction |  reportTransferBalance := (transaction accept: self)].! !


!TranferNetVisitor methodsFor: 'manage transactions' stamp: 'belen 12/5/2021 12:17:41'!
handleTransactionAsDeposit: aDeposit


	^0*peso.! !

!TranferNetVisitor methodsFor: 'manage transactions' stamp: 'belen 12/5/2021 16:40:40'!
handleTransactionAsDepositLeg: aDepositLeg


	^ aDepositLeg affectBalance: reportTransferBalance. 
	! !

!TranferNetVisitor methodsFor: 'manage transactions' stamp: 'belen 12/5/2021 12:18:53'!
handleTransactionAsWithdraw: aWithdraw


	^0*peso.! !

!TranferNetVisitor methodsFor: 'manage transactions' stamp: 'belen 12/5/2021 16:40:33'!
handleTransactionAsWithdrawLeg: aWithdrawLeg


	^ aWithdrawLeg affectBalance: reportTransferBalance. 
	! !


!TranferNetVisitor methodsFor: 'main protocol' stamp: 'belen 12/5/2021 12:50:34'!
printReport
	
	account accept: self.
	
	^reportTransferBalance asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TranferNetVisitor class' category: 'ServiciosFinancieros-Solucion'!
TranferNetVisitor class
	instanceVariableNames: ''!

!TranferNetVisitor class methodsFor: 'instance creation' stamp: 'belen 12/5/2021 11:57:10'!
for: anAccount

	^ self new initializeFor: anAccount! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
