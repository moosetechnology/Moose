Class {
	#name : #JSObjectLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'leftBrace',
		'rightBrace',
		'definitions',
		'commas'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSObjectLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitObjectLiteral: self
]

{ #category : #generated }
JSObjectLiteralNode >> commas [
	^ commas
]

{ #category : #generated }
JSObjectLiteralNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSObjectLiteralNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
JSObjectLiteralNode >> definitions [
	^ definitions
]

{ #category : #generated }
JSObjectLiteralNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #generated }
JSObjectLiteralNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSObjectLiteralNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSObjectLiteralNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSObjectLiteralNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSObjectLiteralNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSObjectLiteralNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSObjectLiteralNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
