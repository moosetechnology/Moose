Class {
	#name : #CSDoStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'doToken',
		'statement',
		'whileToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDoStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDoStatement: self
]

{ #category : #generated }
CSDoStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
CSDoStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
CSDoStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSDoStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSDoStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSDoStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSDoStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSDoStatementNode >> nodeVariables [
	^ #(#statement #expression)
]

{ #category : #generated }
CSDoStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSDoStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSDoStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSDoStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSDoStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSDoStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSDoStatementNode >> tokenVariables [
	^ #(#doToken #whileToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSDoStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
CSDoStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
