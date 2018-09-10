Class {
	#name : #CSCollectionInitializerNode,
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
CSCollectionInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCollectionInitializer: self
]

{ #category : #generated }
CSCollectionInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSCollectionInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSCollectionInitializerNode >> compositeNodeVariables [
	^ #(#initializers)
]

{ #category : #generated }
CSCollectionInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSCollectionInitializerNode >> initialize [
	super initialize.
	initializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSCollectionInitializerNode >> initializers [
	^ initializers
]

{ #category : #generated }
CSCollectionInitializerNode >> initializers: anOrderedCollection [
	self setParents: self initializers to: nil.
	initializers := anOrderedCollection.
	self setParents: self initializers to: self
]

{ #category : #generated }
CSCollectionInitializerNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSCollectionInitializerNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSCollectionInitializerNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSCollectionInitializerNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSCollectionInitializerNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
