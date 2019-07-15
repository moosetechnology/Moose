Class {
	#name : #JavaExpressionStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaExpressionStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpressionStatement: self
]

{ #category : #generated }
JavaExpressionStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaExpressionStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaExpressionStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaExpressionStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaExpressionStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaExpressionStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
