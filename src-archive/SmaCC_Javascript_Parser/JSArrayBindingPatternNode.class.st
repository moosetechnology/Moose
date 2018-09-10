Class {
	#name : #JSArrayBindingPatternNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftBracket',
		'commas',
		'restElement',
		'rightBracket',
		'elements'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSArrayBindingPatternNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayBindingPattern: self
]

{ #category : #generated }
JSArrayBindingPatternNode >> commas [
	^ commas
]

{ #category : #generated }
JSArrayBindingPatternNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSArrayBindingPatternNode >> compositeNodeVariables [
	^ #(#elements)
]

{ #category : #generated }
JSArrayBindingPatternNode >> elements [
	^ elements
]

{ #category : #generated }
JSArrayBindingPatternNode >> elements: anOrderedCollection [
	self setParents: self elements to: nil.
	elements := anOrderedCollection.
	self setParents: self elements to: self
]

{ #category : #generated }
JSArrayBindingPatternNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSArrayBindingPatternNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #'generated-initialize-release' }
JSArrayBindingPatternNode >> initialize [
	super initialize.
	commas := OrderedCollection new: 2.
	elements := OrderedCollection new: 2.
]

{ #category : #generated }
JSArrayBindingPatternNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JSArrayBindingPatternNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JSArrayBindingPatternNode >> nodeVariables [
	^ #(#restElement)
]

{ #category : #generated }
JSArrayBindingPatternNode >> restElement [
	^ restElement
]

{ #category : #generated }
JSArrayBindingPatternNode >> restElement: aJSRestVariableDeclarationNode [
	self restElement notNil
		ifTrue: [ self restElement parent: nil ].
	restElement := aJSRestVariableDeclarationNode.
	self restElement notNil
		ifTrue: [ self restElement parent: self ]
]

{ #category : #generated }
JSArrayBindingPatternNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JSArrayBindingPatternNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
