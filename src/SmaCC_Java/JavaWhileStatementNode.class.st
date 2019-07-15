Class {
	#name : #JavaWhileStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'whileToken',
		'leftParen',
		'expression',
		'rightParen',
		'statement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWhileStatement: self
]

{ #category : #generated }
JavaWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaWhileStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaWhileStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaWhileStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaWhileStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaWhileStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
JavaWhileStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaWhileStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JavaWhileStatementNode >> statement: aJavaStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JavaWhileStatementNode >> tokenVariables [
	^ #(#whileToken)
]

{ #category : #generated }
JavaWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
JavaWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
