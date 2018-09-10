Class {
	#name : #PPAbstractParserTest,
	#superclass : #TestCase,
	#category : #'PetitTests-Core'
}

{ #category : #testing }
PPAbstractParserTest class >> isAbstract [
	^ self name = #PPAbstractParserTest
]

{ #category : #accessing }
PPAbstractParserTest class >> packageNamesUnderTest [
	^ #('PetitParser' 'PetitTests')
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser fail: aCollection [
	^ self assert: aParser fail: aCollection end: 0
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser fail: aCollection end: anInteger [
	| stream result context |
	self 
		assert: aParser isPetitParser
		description: 'Parser invalid'.
	stream := aCollection asPetitStream.
	context := self context.
	
	
	result := aParser parse: stream withContext: context.
	self 
		assert: result isPetitFailure
		description: 'Parser did not fail'.
	self
		assert: context position = anInteger
		description: 'Parser failed at wrong position'.
	^ result
]

{ #category : #utilities }
PPAbstractParserTest >> assert: string1 includesSubstring: string2 [
	"Support portability by using ANSI search method"

	self assert: (string1 notEmpty and: [string2 notEmpty and: [0 < (string1 indexOfSubCollection: string2 startingAt: 1)]])
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aCollection [
	^ self assert: aParser parse: aCollection to: nil end: aCollection size 
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aCollection end: anInteger [
	^ self assert: aParser parse: aCollection to: nil end: anInteger
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aCollection to: anObject [
	^ self assert: aParser parse: aCollection to: anObject end: aCollection size 
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aCollection to: aTargetObject end: anInteger [
	| stream result context |

	self assert: aParser isPetitParser description: 'Parser invalid'.
	stream := aCollection asPetitStream.
	context := self context.
	
	result := aParser parse: stream withContext: context.
	aTargetObject isNil
		ifTrue: [ self deny: result isPetitFailure ]
		ifFalse: [ self assert: result equals: aTargetObject ].
	self assert: context position = anInteger description: 'Parser accepted at wrong position'.
	^ result
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aCollection toToken: aStartInteger stop: aStopInteger [
	^ self assert: aParser parse: aCollection toToken: aStartInteger stop: aStopInteger end: aCollection size
]

{ #category : #utilities }
PPAbstractParserTest >> assert: aParser parse: aParserObject toToken: aStartInteger stop: aStopInteger end: anEndInteger [
	| token |
	token := self
		assert: aParser
		parse: aParserObject
		to: nil
		end: anEndInteger.
	self assert: (token isKindOf: PPToken).
	self assert: token start equals: aStartInteger.
	self assert: token stop equals: aStopInteger.
	^ token
]

{ #category : #context }
PPAbstractParserTest >> context [
	^ PPContext new
]
