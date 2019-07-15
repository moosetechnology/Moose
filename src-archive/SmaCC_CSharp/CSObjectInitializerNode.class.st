Class {
	#name : #CSObjectInitializerNode,
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
CSObjectInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitObjectInitializer: self
]

{ #category : #generated }
CSObjectInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSObjectInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSObjectInitializerNode >> compositeNodeVariables [
	^ #(#initializers)
]

{ #category : #generated }
CSObjectInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSObjectInitializerNode >> initialize [
	super initialize.
	initializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSObjectInitializerNode >> initializers [
	^ initializers
]

{ #category : #generated }
CSObjectInitializerNode >> initializers: anOrderedCollection [
	self setParents: self initializers to: nil.
	initializers := anOrderedCollection.
	self setParents: self initializers to: self
]

{ #category : #generated }
CSObjectInitializerNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSObjectInitializerNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSObjectInitializerNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSObjectInitializerNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSObjectInitializerNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
