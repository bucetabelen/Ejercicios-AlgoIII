!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'belen 10/30/2021 13:01:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'belen 10/30/2021 15:08:42'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'belen 10/30/2021 12:35:07'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.

	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'belen 10/29/2021 14:50:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'belen 11/2/2021 14:16:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'belen 11/2/2021 14:16:26'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'mely 10/31/2021 16:00:28'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
		
! !

!OOStackTest methodsFor: 'test' stamp: 'belen 10/30/2021 15:44:29'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
		
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'belen 11/2/2021 14:16:26'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 12:00:05'!
test01AddSentencesToTheStackAndTheStackGrowsInSize

	|finder|

	finder := SentenceFinderByPrefix new.
	finder addSentence: 'hola'.
	finder addSentence: 'como'.
	finder addSentence: 'todo'.
	

	
	self assert: (finder sizeOfStackOfSentences) equals: 3.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 13:03:22'!
test02AllTheSentencesAddedToTheStackHaveTheSamePrefixAndFindReturnSameNumberOfSentences

	|finder sentencesWithPrefix|
	
	finder := SentenceFinderByPrefix new.
	
	finder addSentence: 'hola como estas'.
	finder addSentence: 'hola todo bien'.
	finder addSentence: 'hola'.
	
	sentencesWithPrefix := finder find: 'hol'.

	self assert: (finder sizeOfSentencesWithPrefix: sentencesWithPrefix)equals: 3.
	self assert: (finder find: 'hol') equals: (OrderedCollection with: 'hola' with: 'hola todo bien' with: 'hola como estas').
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 12:14:59'!
test03PrefixIsCaseSensitiveAndFindDoesNotReturnSentences

	|finder sentencesWithPrefix |
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'hOL andas'.
	finder addSentence: 'adios hola'.
	
	
	
	sentencesWithPrefix := finder find: 'Hol'.
	
	self assert: (finder sizeOfSentencesWithPrefix: sentencesWithPrefix)  equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 13:00:49'!
test04FindJustReturnsTheSentencesThatMatchedWithThePrefix

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'winter is coming'.
	finder addSentence: 'winnning is everything'.
	finder addSentence: 'the winds of Winter'.
	finder addSentence: 'Winter is here'.
	
	
	
	self assert: (finder find: 'Wint') equals: (OrderedCollection with:'Winter is here').
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 22:28:41'!
test05AfterFindOperationStackKeepsSameOrder

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: '1'.
	finder addSentence: '2'.
	finder addSentence: '3'.
	
	finder find: '1'.
	finder find: '2'.
	finder find: '3'.
	
	self assert: (finder topOfStackSentences) equals: '3'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 12:17:30'!
test06SentencesAddedToTheStackHaveTheSamePrefixAndFindReturnsThatSentences

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'hola que tal'.
	
	
	
	
	self assert: (finder find: 'hol') equals: (OrderedCollection  with: 'hola que tal' with:'hola'). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/2/2021 12:21:22'!
test07FindDoesNotAcumulateTheSentencesJustReturnsTheSentencesMatchedWithTheCurrentlyFindOperation

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	finder addSentence: 'ho jojo'.
	
	
	finder find: 'ad'.
	finder find: 'com'.

	
	self assert: (finder find: 'ho') equals: (OrderedCollection  with: 'ho jojo'  with:'hola'). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/3/2021 20:57:08'!
test08CanNotFindWhenPrefixIsEmpty 

	| finder  |
	
	finder := SentenceFinderByPrefix  new.
	
	

	self
		should: [ finder prefixIsValid: ''.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/3/2021 21:01:33'!
test09CanNotFindWhenPrefixIsWhiteSpace 

	| finder  |
	
	finder := SentenceFinderByPrefix  new.
	
	
	self
		should: [ finder prefixIsValid: 'hola  como todo esta']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Melany 11/3/2021 13:23:31'!
test10AfterFindOperationTheStackOfSentencesKeepsSameNumberOfSentences

	|finder|

	finder := SentenceFinderByPrefix new.
	finder addSentence: 'hola'.
	finder addSentence: 'como'.
	finder addSentence: 'todo'.
	
	finder find: 'ho'.
	

	
	self assert: (finder sizeOfStackOfSentences) equals: 3.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'belen 11/2/2021 22:17:14'!
isEmpty
	
	^stack isEmpty.
	
! !


!OOStack methodsFor: 'accesing' stamp: 'Melany 11/3/2021 18:32:36'!
pop

	^self stateOfStack popFromStack: stack.! !

!OOStack methodsFor: 'accesing' stamp: 'Melany 11/3/2021 18:35:15'!
push: something


	^ OOStackStateNotEmpty new push: something in: stack.
	
	
	
	! !

!OOStack methodsFor: 'accesing' stamp: 'belen 11/2/2021 22:14:06'!
size

	^stack size.! !

!OOStack methodsFor: 'accesing' stamp: 'Melany 11/3/2021 18:32:14'!
top

	^self stateOfStack topOf: stack.! !


!OOStack methodsFor: 'testing - private' stamp: 'Melany 11/3/2021 18:32:14'!
stateOfStack
	
	| stateOfCurrentStack |
	stateOfCurrentStack := StateOfOOStack subclasses detect:[:subclass | subclass canInstatianteWith: stack].
	
	^ stateOfCurrentStack new.
	
! !


!OOStack methodsFor: 'instance' stamp: 'Melany 11/3/2021 18:25:16'!
initialize
	
	stack := OrderedCollection new.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'belen 10/29/2021 15:18:18'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackOfSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'belen 11/1/2021 12:33:31'!
sizeOfSentencesWithPrefix: sentencesWithPrefix

	^sentencesWithPrefix size.! !

!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'belen 11/2/2021 12:00:05'!
sizeOfStackOfSentences

	^stackOfSentences size.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'belen 11/2/2021 11:58:27'!
addSentence: aSentence

	^stackOfSentences push: aSentence.
	
	
	

	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'Melany 11/3/2021 18:37:03'!
find: aPrefix

	self prefixIsValid: aPrefix.
	^self findSentencesWithSamePrefix: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'testing - private' stamp: 'belen 11/3/2021 21:04:53'!
prefixIsValid: aPrefix
	. 
	(aPrefix sameAs: '') ifTrue:[ ^self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	(aPrefix withoutSeparators = aPrefix) ifFalse: [ ^ self error: SentenceFinderByPrefix prefixEmptySpaceErrorDescription ].
	
! !

!SentenceFinderByPrefix methodsFor: 'testing - private' stamp: 'belen 11/2/2021 14:16:26'!
sentenceHasSamePrefix: aPrefix

	^ (aPrefix commonPrefixWith: stackOfSentences top)  = aPrefix size. ! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'belen 11/2/2021 14:18:02'!
topOfStackSentences

	^stackOfSentences top.! !


!SentenceFinderByPrefix methodsFor: 'instance' stamp: 'belen 11/2/2021 11:58:27'!
initialize

	stackOfSentences := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'Melany 11/3/2021 18:37:03'!
findSentencesWithSamePrefix: aPrefix

	|sentencesWithPrefix aux |
	
	
	sentencesWithPrefix := OrderedCollection new.
	aux := OrderedCollection new.
	

 	1 to: (stackOfSentences size) do:[:index |
		
		(self sentenceHasSamePrefix: aPrefix)  ifTrue:[sentencesWithPrefix add: stackOfSentences top].
		aux add: stackOfSentences pop.
	].

	self updateStackOfSentences: aux.
	^sentencesWithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'belen 11/2/2021 12:45:33'!
updateStackOfSentences: aux
	
	|stackAux|
	
	stackAux  := OOStack new.

	(1 to: aux size) reverseDo: [:index | stackAux push: 
		(aux at: index)].
	
	^stackOfSentences := stackAux.  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:59:54'!
prefixEmptyErrorDescription
	
	^ 'Prefix is empty'
	! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'Melany 11/3/2021 18:06:25'!
prefixEmptySpaceErrorDescription
	
	^ 'Prefix can not include an empty space'.! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 11/2/2021 15:04:45'!
popFromStack: stack

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 11/2/2021 14:48:40'!
push: something in: stack
	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 11/2/2021 14:50:10'!
topOf: stack

	self subclassResponsibility.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfOOStack class' category: 'Stack-Exercise'!
StateOfOOStack class
	instanceVariableNames: ''!

!StateOfOOStack class methodsFor: 'as yet unclassified' stamp: 'Melany 11/3/2021 18:24:39'!
canInstatianteWith: stack

	self subclassResponsibility! !


!classDefinition: #OOStackStateEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackStateEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStateEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 15:04:45'!
popFromStack: stack

	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackStateEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 14:51:53'!
push: something in: stack
	
	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackStateEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 14:52:11'!
topOf:stack

	^self error: OOStack stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStateEmpty class' category: 'Stack-Exercise'!
OOStackStateEmpty class
	instanceVariableNames: ''!

!OOStackStateEmpty class methodsFor: 'as yet unclassified' stamp: 'Melany 11/3/2021 18:24:39'!
canInstatianteWith: stack

	^stack isEmpty.! !


!classDefinition: #OOStackStateNotEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackStateNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStateNotEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 15:04:45'!
popFromStack: stack

	
	^ stack removeLast.
	
	! !

!OOStackStateNotEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 22:16:31'!
push: something in: stack

	^stack addLast: something.
	! !

!OOStackStateNotEmpty methodsFor: 'accesing' stamp: 'belen 11/2/2021 14:51:19'!
topOf: stack

	^stack at: (stack size)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStateNotEmpty class' category: 'Stack-Exercise'!
OOStackStateNotEmpty class
	instanceVariableNames: ''!

!OOStackStateNotEmpty class methodsFor: 'as yet unclassified' stamp: 'Melany 11/3/2021 18:24:39'!
canInstatianteWith: stack

	^(stack isEmpty not).
	! !
