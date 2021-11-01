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

!OOStackTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:02:25'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:02:25'!
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

!OOStackTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:02:25'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 12:34:37'!
test01AddSentencesToTheStackAndTheStackGrowsInSize

	|finder|

	finder := SentenceFinderByPrefix new.
	finder addSentence: 'hola'.
	finder addSentence: 'como'.
	finder addSentence: 'todo'.
	

	
	self assert: (finder sizeOfStack) equals: 3.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 12:36:28'!
test02TheSentenceAddedToTheStackHadTheSamePrefixAndTheSentencesgrowsInSize

	|finder sentencesWithPrefix|
	
	finder := SentenceFinderByPrefix new.
	
	finder addSentence: 'hola como estas'.
	finder addSentence: 'hola todo bien'.
	finder addSentence: 'hola'.
	
	sentencesWithPrefix := finder find: 'hol'.

	self assert: (finder sizeOfSentencesWithPrefix: sentencesWithPrefix)equals: 3.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 12:42:00'!
test03PrefixIsCaseSensitiveAndFindDoesNotReturnSentences

	|finder sentencesWithPrefix|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'hOL andas'.
	finder addSentence: 'adios hola'.
	
	sentencesWithPrefix := finder find: 'Hol'.
	self assert: (finder sizeOfSentencesWithPrefix: sentencesWithPrefix ) equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:32:39'!
test04FindJustReturnsTheSentencesThatMatchedWithThePrefix

	|finder sentenceWithPrefix|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	
	sentenceWithPrefix := finder find: 'hol'.
	
	
	self assert: (finder sizeOfSentencesWithPrefix: sentenceWithPrefix ) equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:02:25'!
test05AfterFindOperationStackKeepsSameOrder

	|finder|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: '1'.
	finder addSentence: '2'.
	finder addSentence: '3'.
	
	finder find: '1'.
	self assert: (finder top) equals: '3'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:33:23'!
test06SentencesAddedToTheStackHaveTheSamePrefixAndFindReturnsThatSentences

	|finder sentenceWithPrefix|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'hola que tal'.
	
	sentenceWithPrefix := finder find: 'hol'.
	
	
	self assert: (finder sizeOfSentencesWithPrefix: sentenceWithPrefix ) equals: 2.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 13:34:36'!
test07FindDoesNotAcumulateTheSentencesJustReturnsTheSentencesMatchedWithTheCurrentlyFindOperation

	|finder sentenceWithPrefix|
	
	finder := SentenceFinderByPrefix new.

	finder addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	
	finder find:'hol'.
	sentenceWithPrefix := finder find: 'com'.
	
	
	self assert: (finder sizeOfSentencesWithPrefix: sentenceWithPrefix ) equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 12:40:20'!
test08CanNotFindWhenPrefixIsEmpty 

	| finder  |
	
	finder := SentenceFinderByPrefix  new.
	
	
	self
		should: [ finder find: '']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'belen 11/1/2021 12:40:27'!
test09CanNotFindWhenPrefixIsWhiteSpace 

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


!OOStack methodsFor: 'testing' stamp: 'mm 10/31/2021 21:40:44'!
isEmpty
	
	^stack isEmpty.
	
! !


!OOStack methodsFor: 'accesing' stamp: 'belen 10/30/2021 19:06:45'!
pop
	self verifyStateOfStackEmpty.
	^stack pop! !

!OOStack methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:15:43'!
push: something


	self verifyStateOfStack.
	stack push: something.
	
	
	! !

!OOStack methodsFor: 'accesing' stamp: 'belen 10/29/2021 15:06:24'!
size

	^stack size.! !

!OOStack methodsFor: 'accesing' stamp: 'belen 11/1/2021 13:02:25'!
top

	^stack top.! !


!OOStack methodsFor: 'testing - private' stamp: 'belen 10/30/2021 15:06:11'!
verifyStateOfStack

	stack isEmpty ifTrue:[^stack := OOStackNotEmpty new.].
	
! !

!OOStack methodsFor: 'testing - private' stamp: 'belen 11/1/2021 12:56:31'!
verifyStateOfStackEmpty

	stack isEmpty ifTrue:[^stack := OOStackEmpty new.].! !

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

!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'belen 11/1/2021 12:33:31'!
sizeOfSentencesWithPrefix: sentencesWithPrefix

	^sentencesWithPrefix size.! !

!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'belen 11/1/2021 12:12:50'!
sizeOfStack

	^stack size.! !

!SentenceFinderByPrefix methodsFor: 'accesing' stamp: 'belen 11/1/2021 13:02:25'!
top
	
	^stack top.! !


!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mely 10/31/2021 15:45:56'!
initialize

	stack := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'belen 10/31/2021 11:12:35'!
addSentence: aSentence

	^stack push: aSentence.
	
	
	

	! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'belen 11/1/2021 13:02:25'!
find: aPrefix
	
	|sizeOfPrefix aux sentencesWithPrefix|
	
	self validatePrefixIsValid: aPrefix .
	sizeOfPrefix := aPrefix size.
	
	sentencesWithPrefix := OrderedCollection new.
	aux := OrderedCollection new.
	
 	1 to: (stack size) do:[:index |
		|tam|
		 
		tam := aPrefix commonPrefixWith: stack top.
		tam = sizeOfPrefix ifTrue:[sentencesWithPrefix add: stack top].
		aux add: stack pop.
		].
	self updateStack: aux.
	^sentencesWithPrefix.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'belen 11/1/2021 12:11:26'!
validatePrefixIsValid: aPrefix
	
	(aPrefix = '') ifTrue:[^self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	
	(aPrefix = ' ') ifTrue: [^self error: SentenceFinderByPrefix prefixEmptySpaceErrorDescription].! !


!SentenceFinderByPrefix methodsFor: 'operations - private' stamp: 'mely 10/31/2021 15:39:26'!
updateStack: aux
	
	|stackAux|
	
	stackAux  := OOStack new.

	(1 to: aux size) reverseDo: [:index | stackAux push: 
		(aux at: index)].
	
	^stack := stackAux.  ! !

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

!StateOfOOStack methodsFor: 'as yet unclassified' stamp: 'belen 11/1/2021 12:48:28'!
initialize

	self subclassResponsibility.! !


!StateOfOOStack methodsFor: 'testing' stamp: 'belen 10/30/2021 14:53:41'!
isEmpty

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'testing' stamp: 'belen 10/30/2021 15:19:08'!
size

	self subclassResponsibility.! !


!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:39:57'!
pop

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:09:46'!
push: something

	self subclassResponsibility.! !

!StateOfOOStack methodsFor: 'accesing' stamp: 'belen 11/1/2021 13:02:25'!
top

	self subclassResponsibility.
	! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'testing' stamp: 'belen 10/30/2021 15:47:37'!
isEmpty

	^true.! !


!OOStackEmpty methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:51:20'!
pop

	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'accesing' stamp: 'belen 11/1/2021 12:46:59'!
push: something
	
	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:52:38'!
size

	^self error: OOStack stackEmptyErrorDescription.! !

!OOStackEmpty methodsFor: 'accesing' stamp: 'belen 11/1/2021 13:02:25'!
top

	^self error: OOStack stackEmptyErrorDescription.! !


!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'belen 11/1/2021 12:48:45'!
initialize! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'belen 11/1/2021 12:48:10'!
initialize

	stack := OrderedCollection new.! !


!OOStackNotEmpty methodsFor: 'accesing' stamp: 'belen 10/30/2021 19:06:59'!
pop

	| removed |
	removed := stack removeLast.
	
	
	^removed.
	
	! !

!OOStackNotEmpty methodsFor: 'accesing' stamp: 'belen 10/30/2021 12:46:35'!
push: something

	stack addLast: something.
	! !

!OOStackNotEmpty methodsFor: 'accesing' stamp: 'belen 10/30/2021 15:19:24'!
size

	^stack size.! !

!OOStackNotEmpty methodsFor: 'accesing' stamp: 'belen 11/1/2021 13:02:25'!
top

	^stack at: (stack size)! !


!OOStackNotEmpty methodsFor: 'testing' stamp: 'belen 10/30/2021 15:39:03'!
isEmpty

	^(self size = 0)! !
