Class {
	#name : #CSElementInitializerNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'expressions',
		'leftBraceToken',
		'commaTokens',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSElementInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElementInitializer: self
]

{ #category : #generated }
CSElementInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSElementInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSElementInitializerNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
CSElementInitializerNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSElementInitializerNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSElementInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSElementInitializerNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSElementInitializerNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSElementInitializerNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSElementInitializerNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSElementInitializerNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSElementInitializerNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
