Class {
	#name : #JavaIfStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'ifToken',
		'leftParen',
		'expression',
		'rightParen',
		'trueStatement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaIfStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIfStatement: self
]

{ #category : #generated }
JavaIfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaIfStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaIfStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
JavaIfStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
JavaIfStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaIfStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaIfStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaIfStatementNode >> nodeVariables [
	^ #(#expression #trueStatement)
]

{ #category : #generated }
JavaIfStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaIfStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaIfStatementNode >> tokenVariables [
	^ #(#ifToken)
]

{ #category : #generated }
JavaIfStatementNode >> trueStatement [
	^ trueStatement
]

{ #category : #generated }
JavaIfStatementNode >> trueStatement: aJavaStatementNode [
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: nil ].
	trueStatement := aJavaStatementNode.
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: self ]
]
