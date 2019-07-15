"
Evalaute the following code to verify the complete image.
"
Class {
	#name : #PPSmalltalkClassesTests,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitSmalltalk-Tests'
}

{ #category : #utilities }
PPSmalltalkClassesTests class >> benchmark: aParser [
	"self benchmark: PPSmalltalkGrammar new"
	"self benchmark: PPSmalltalkParser new"
	"self benchmark: RBParser"
	
	| sources |
	sources := OrderedCollection new.
	SequenceableCollection withAllSubclassesDo: [ :class |
		class selectorsDo: [ :selector |
			sources add: (class sourceCodeAt: selector) ] ].
	^ self benchmark: aParser sources: sources asArray
]

{ #category : #utilities }
PPSmalltalkClassesTests class >> benchmark: aParser sources: aCollection [
	| count start |
	count := 0.
	start := Time millisecondClockValue.
	[  aCollection do: [ :each | aParser parseMethod: each ].
		count := count + 1.
		(Time millisecondsSince: start) < 10000 ] whileTrue.
	^ (1000 * count * (aCollection detectSum: [ :each | each size ]) 
		/ (Time millisecondsSince: start)) asInteger asString , ' characters/sec'
]

{ #category : #accessing }
PPSmalltalkClassesTests class >> packageNamesUnderTest [
	^ #('PetitSmalltalk')
]

{ #category : #utilities }
PPSmalltalkClassesTests class >> verifySystem [
	Smalltalk globals allClasses
		inject: self new
		into: [ :test :class | test verifyClass: class ]
]

{ #category : #private }
PPSmalltalkClassesTests >> assert: aBoolean description: aString [ 
	self 
		assert: aBoolean
		description: aString
		resumable: true
]

{ #category : #accessing }
PPSmalltalkClassesTests >> parserClass [
	^ PPSmalltalkParser
]

{ #category : #testing }
PPSmalltalkClassesTests >> testCollection [
	self verifyClass: Collection.
	self verifyClass: Array.
	self verifyClass: Set.
	self verifyClass: Dictionary.
	self verifyClass: Bag.
	self verifyClass: OrderedCollection.
	self verifyClass: SortedCollection
]

{ #category : #testing }
PPSmalltalkClassesTests >> testException [
	self verifyClass: Exception.
	self verifyClass: Notification.
	self verifyClass: Warning.
	self verifyClass: Error
]

{ #category : #testing }
PPSmalltalkClassesTests >> testFundamental [
	self verifyClass: Object.
	self verifyClass: Boolean.
	self verifyClass: True.
	self verifyClass: False.
	self verifyClass: Character



]

{ #category : #testing }
PPSmalltalkClassesTests >> testMagnitude [
	self verifyClass: Magnitude.
	self verifyClass: Number.
	self verifyClass: Integer.
	self verifyClass: Float.
	self verifyClass: Fraction
]

{ #category : #'testing-protocol' }
PPSmalltalkClassesTests >> testParseExpression [
	result := self parserClass parseExpression: '1 + 2'.
	self assert: result isMessage.
	self assert: result source equals: '1 + 2'.
	result := self parserClass parseExpression: '| a | 1 + a'.
	self assert: result isSequence.
	self assert: result source equals: '| a | 1 + a'.
	result := self parserClass parseExpression: '1 + 2. ^ 3'.
	self assert: result isSequence.
	self assert: result source equals: '1 + 2. ^ 3'.
	result := self parserClass parseExpression: '1 + ' onError: [ :err | true ].
	self assert: result.
	self should: [ self parserClass parseExpression: '1 + ' ] raise: Error
]

{ #category : #'testing-protocol' }
PPSmalltalkClassesTests >> testParseMethod [
	result := self parserClass parseMethod: 'do 1 + 2'.
	self assert: result isMethod.
	self assert: result source equals: 'do 1 + 2'.
	result := self parserClass parseMethod: 'do 1 +' onError: [ :err | true ].
	self assert: result.
	self should: [ self parserClass parseMethod: 'do 1 +' ] raise: Error
]

{ #category : #testing }
PPSmalltalkClassesTests >> testStream [
	self verifyClass: Stream.
	self verifyClass: ReadStream.
	self verifyClass: WriteStream
]

{ #category : #private }
PPSmalltalkClassesTests >> verifyClass: aClass [ 
	aClass selectors 
		do: [ :selector | self verifyClass: aClass selector: selector ].
	aClass isMeta
		ifFalse: [ self verifyClass: aClass class ]
]

{ #category : #private }
PPSmalltalkClassesTests >> verifyClass: aClass selector: aSelector [ 
	"Verifies that the method aSelector in aClass parses the same using the standard refactoring parser and the petit smalltalk parser. Also make sure that the position information of all tokens and comments is equal."

	| signature source original other checker |
	signature := aClass name , '>>#' , aSelector.
	source := aClass sourceCodeAt: aSelector.
	source isNil ifTrue: [ ^ self ].
	original := aClass parseTreeFor: aSelector.
	original isNil ifTrue: [ ^ self ].
	other := self parserInstance
		parseMethod: source
		onError: [ :err | self assert: false description: signature ].
	self 
		assert: original = other
		description: 'Code in ' , signature.
	checker := [ :node1 :node2 |
		self 
			assert: node1 sourceInterval = node2 sourceInterval 
			description: 'Source intervals in ' , signature.
		(node1 isArray or: [ node1 isBlock or: [ node1 isPragma ] ]) ifTrue: [
			self
				assert: node1 left = node2 left
				description: 'Source position left in ' , signature.
			self
				assert: node1 right = node2 right
				description: 'Source position right in ' , signature ].
		(node1 isSequence) ifTrue: [
			self
				assert: node1 leftBar = node2 leftBar
				description: 'Source position leftBar in ' , signature.
			self
				assert: node1 rightBar = node2 rightBar
				description: 'Source position rightBar in ' , signature ].
		(node1 isBlock) ifTrue: [
			self
				assert: node1 bar = node2 bar
				description: 'Source position bar in ' , signature ].
		(node1 isReturn) ifTrue: [
			self
				assert: node1 return = node2 return
				description: 'Source position return in ' , signature ].
		(node1 isAssignment) ifTrue: [
			self
				assert: node1 assignment = node2 assignment
				description: 'Source position return in ' , signature ].
		(node1 isCascade) ifTrue: [
			self
				assert: node1 semicolons asArray = node2 semicolons asArray
				description: 'Source position semicolons in ' , signature ].
		(node1 isArray or: [ node1 isSequence ]) ifTrue: [
			self
				assert: node1 periods asArray = node2 periods asArray
				description: 'Source position periods in ' , signature ].
		(node1 isMethod or: [ node1 isMessage or: [ node1 isPragma ] ]) ifTrue: [
			self
				assert: node1 keywordsPositions = node2 keywordsPositions 
				description: 'Source position keywords positions in ' , signature ].
		node1 children with: node2 children do: checker ].
	checker value: original value: other
]
