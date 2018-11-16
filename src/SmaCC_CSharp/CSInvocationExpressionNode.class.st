Class {
	#name : #CSInvocationExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'leftParenToken',
		'arguments',
		'commaTokens',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInvocationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInvocationExpression: self
]

{ #category : #generated }
CSInvocationExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSInvocationExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSInvocationExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSInvocationExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSInvocationExpressionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CSInvocationExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSInvocationExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSInvocationExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSInvocationExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSInvocationExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSInvocationExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSInvocationExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSInvocationExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSInvocationExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSInvocationExpressionNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
