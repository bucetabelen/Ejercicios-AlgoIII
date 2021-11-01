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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'belen 10/31/2021 12:59:05'!
test01AddSentenceToTheStackAndTheStackGrowsInSize

	|finder|

	finder := SentenceFinderByPrefix new.
	finder addSentence: 'hola'.
	finder addSentence: 'como'.
	finder addSentence: 'todo'.
	
	
	self assert: (finder cantidadTotalDeOraciones) equals: 3.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 14:51:45'!
test02TheSentenceAddedToTheStackHadTheSamePrefixAndTheSentencesgrowsInSize

	|finder|
	
	finder := SentenceFinderByPrefix new.
	
	finder addSentence: 'hola como estas'.


	self assert: (finder find: 'hol')equals: 1.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 14:56:44'!
test03SentencesAddedToTheStackHadTheSamePrefixAndTheSentencesgrowsInSize

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'hola que tal'.
	
	self assert: (finder find: 'hol') equals: 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:42:52'!
test04SomeSentencesAddedToTheStackHadDifferentPrefixAndTheSentencesDoNotGrowInSize

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	
	self assert: (finder find: 'hol') equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:41:57'!
test05AfterFindOperationStackKeepsSameOrder

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: '1'.
	finder addSentence: '2'.
	finder addSentence: '3'.
	
	finder find: '1'.
	self assert: (finder top) equals: '3'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mm 10/31/2021 21:44:10'!
test06DoContinuousFindsAndReturnsTheCorrectValueInEachOne

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	
	finder find: 'hol'.
	
	self assert: (finder find: 'com') equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 16:24:19'!
test07PrefixCanNotEmpty 

	| finder  |
	
	finder := SentenceFinderByPrefix  new.
	
	
	self
		should: [ finder find: '']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 16:24:57'!
test08PrefixCanNotWhiteSpace 

	| finder  |
	
	finder := SentenceFinderByPrefix  new.
	
	
	self
		should: [ finder find: ' ']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription ]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:55:10'!
initialize
	
	stack := OOStackEmpty new.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mm 10/31/2021 21:40:44'!
isEmpty
	
	^stack isEmpty.
	
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 19:06:45'!
pop
	self verifyStateOfStackEmpty.
	^stack pop! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:15:43'!
push: something


	self verifyStateOfStack.
	stack push: something.
	
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/29/2021 15:06:24'!
size

	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mm 10/31/2021 21:40:59'!
top

	^stack top.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:06:11'!
verifyStateOfStack

	stack isEmpty ifTrue:[^stack := OOStackNotEmpty new.].
	
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:43:50'!
verifyStateOfStackEmpty

	stack isEmpty ifTrue:[^self error: OOStack stackEmptyErrorDescription .].! !

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
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'belen 10/31/2021 11:12:35'!
addSentence: aSentence

	^stack push: aSentence.
	
	
	

	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 16:17:09'!
cantidadTotalDeOraciones

	^stack size.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 16:03:33'!
find: aPrefix
	
	|sizeOfPrefix aux sentences|
	
	self validatePrefix: aPrefix .
	sizeOfPrefix := aPrefix size.
	
	sentences := OrderedCollection new.
	aux := OrderedCollection new.
	
 	1 to: (stack size) do:[:index |
		|tam|
		 
		tam := aPrefix commonPrefixWith: stack top.
		tam = sizeOfPrefix ifTrue:[sentences add: stack top].
		aux add: stack pop.
		].
	self updateStack: aux.
	^sentences size.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:45:56'!
initialize

	stack := OOStack new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'belen 10/31/2021 12:42:39'!
sentencesSize

	^sentences size.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:22:39'!
top
	
	^stack top.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:39:26'!
updateStack: aux
	
	|stackAux|
	
	stackAux  := OOStack new.

	(1 to: aux size) reverseDo: [:index | stackAux push: 
		(aux at: index)].
	
	^stack := stackAux.  ! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 16:17:42'!
validatePrefix: aPrefix
	
	(aPrefix = '') ifTrue:[^self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	
	(aPrefix = ' ') ifTrue: [^self error: SentenceFinderByPrefix prefixEmptySpaceErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:59:54'!
prefixEmptyErrorDescription
	
	^ 'Prefix is empty'
	! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 16:22:13'!
prefixEmptySpaceErrorDescription
	
	^ 'Prefix can not include an empty space'.! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:10:05'!
initialize

	stack := OrderedCollection new.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 14:53:41'!
isEmpty

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:39:57'!
pop

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:18:58'!
push

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:09:46'!
push: something

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:19:08'!
size

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:18:47'!
top

	self subclassResponsibility.
	! !

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 18:58:21'!
verifyStateOfStack

	self subclassResponsibility.! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:47:37'!
isEmpty

	^true.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:51:20'!
pop

	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:52:46'!
push
	
	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:52:38'!
size

	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:50:12'!
top

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:39:03'!
isEmpty

	^(self size = 0)! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 19:06:59'!
pop

	| removed |
	removed := stack removeLast.
	
	
	^removed.
	
	! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 12:46:35'!
push: something

	stack addLast: something.
	! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:19:24'!
size

	^stack size.! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 10/30/2021 15:17:53'!
top

	^stack at: (stack size)! !
