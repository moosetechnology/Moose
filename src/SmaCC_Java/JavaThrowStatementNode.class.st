Class {
	#name : #JavaThrowStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'throwToken',
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaThrowStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThrowStatement: self
]

{ #category : #generated }
JavaThrowStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaThrowStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaThrowStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaThrowStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaThrowStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaThrowStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaThrowStatementNode >> throwToken [
	^ throwToken
]

{ #category : #generated }
JavaThrowStatementNode >> throwToken: aSmaCCToken [
	throwToken := aSmaCCToken
]

{ #category : #generated }
JavaThrowStatementNode >> tokenVariables [
	^ #(#throwToken)
]
