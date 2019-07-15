Class {
	#name : #JavaDoWhileStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'doToken',
		'statement',
		'whileToken',
		'leftParen',
		'expression',
		'rightParen',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaDoWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDoWhileStatement: self
]

{ #category : #generated }
JavaDoWhileStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaDoWhileStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaDoWhileStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #semicolon)
]

{ #category : #generated }
JavaDoWhileStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaDoWhileStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> nodeVariables [
	^ #(#statement #expression)
]

{ #category : #generated }
JavaDoWhileStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaDoWhileStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaDoWhileStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JavaDoWhileStatementNode >> statement: aJavaStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JavaDoWhileStatementNode >> tokenVariables [
	^ #(#doToken #whileToken)
]

{ #category : #generated }
JavaDoWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
JavaDoWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
