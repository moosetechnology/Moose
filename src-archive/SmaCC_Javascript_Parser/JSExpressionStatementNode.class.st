Class {
	#name : #JSExpressionStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSExpressionStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpressionStatement: self
]

{ #category : #generated }
JSExpressionStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSExpressionStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSExpressionStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSExpressionStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSExpressionStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSExpressionStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
