Class {
	#name : #CSAnonymousObjectCreationExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'newToken',
		'leftBraceToken',
		'declarators',
		'commaTokens',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousObjectCreationExpression: self
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> compositeNodeVariables [
	^ #(#declarators)
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSAnonymousObjectCreationExpressionNode >> initialize [
	super initialize.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSAnonymousObjectCreationExpressionNode >> tokenVariables [
	^ #(#newToken #leftBraceToken #rightBraceToken)
]
