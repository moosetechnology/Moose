Class {
	#name : #JSThrowStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'throwToken',
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSThrowStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThrowStatement: self
]

{ #category : #generated }
JSThrowStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSThrowStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSThrowStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSThrowStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSThrowStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSThrowStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSThrowStatementNode >> throwToken [
	^ throwToken
]

{ #category : #generated }
JSThrowStatementNode >> throwToken: aSmaCCToken [
	throwToken := aSmaCCToken
]

{ #category : #generated }
JSThrowStatementNode >> tokenVariables [
	^ #(#throwToken)
]
