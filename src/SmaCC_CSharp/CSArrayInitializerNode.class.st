Class {
	#name : #CSArrayInitializerNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'leftBraceToken',
		'initializers',
		'commaTokens',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSArrayInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayInitializer: self
]

{ #category : #generated }
CSArrayInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSArrayInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSArrayInitializerNode >> compositeNodeVariables [
	^ #(#initializers)
]

{ #category : #generated }
CSArrayInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSArrayInitializerNode >> initialize [
	super initialize.
	initializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSArrayInitializerNode >> initializers [
	^ initializers
]

{ #category : #generated }
CSArrayInitializerNode >> initializers: anOrderedCollection [
	self setParents: self initializers to: nil.
	initializers := anOrderedCollection.
	self setParents: self initializers to: self
]

{ #category : #generated }
CSArrayInitializerNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSArrayInitializerNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSArrayInitializerNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSArrayInitializerNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSArrayInitializerNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
