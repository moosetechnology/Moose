Class {
	#name : #JSArrayLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'leftBracket',
		'commas',
		'rightBracket',
		'expressions'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSArrayLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayLiteral: self
]

{ #category : #generated }
JSArrayLiteralNode >> commas [
	^ commas
]

{ #category : #generated }
JSArrayLiteralNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSArrayLiteralNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JSArrayLiteralNode >> expressions [
	^ expressions
]

{ #category : #generated }
JSArrayLiteralNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JSArrayLiteralNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSArrayLiteralNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #'generated-initialize-release' }
JSArrayLiteralNode >> initialize [
	super initialize.
	commas := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
JSArrayLiteralNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JSArrayLiteralNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JSArrayLiteralNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JSArrayLiteralNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
