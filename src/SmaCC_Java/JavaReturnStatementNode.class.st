Class {
	#name : #JavaReturnStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'returnToken',
		'expression',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaReturnStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitReturnStatement: self
]

{ #category : #generated }
JavaReturnStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaReturnStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaReturnStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaReturnStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaReturnStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
JavaReturnStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
JavaReturnStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaReturnStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaReturnStatementNode >> tokenVariables [
	^ #(#returnToken)
]
