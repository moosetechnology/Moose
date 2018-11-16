Class {
	#name : #JSReturnStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'returnToken',
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSReturnStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitReturnStatement: self
]

{ #category : #generated }
JSReturnStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSReturnStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSReturnStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSReturnStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSReturnStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
JSReturnStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
JSReturnStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSReturnStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSReturnStatementNode >> tokenVariables [
	^ #(#returnToken)
]
