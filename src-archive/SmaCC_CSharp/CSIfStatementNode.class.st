Class {
	#name : #CSIfStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'ifToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'thenStatement',
		'elseToken',
		'elseStatement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSIfStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIfStatement: self
]

{ #category : #generated }
CSIfStatementNode >> elseStatement [
	^ elseStatement
]

{ #category : #generated }
CSIfStatementNode >> elseStatement: aCSStatementNode [
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: nil ].
	elseStatement := aCSStatementNode.
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: self ]
]

{ #category : #generated }
CSIfStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
CSIfStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
CSIfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSIfStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSIfStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
CSIfStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
CSIfStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSIfStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSIfStatementNode >> nodeVariables [
	^ #(#expression #thenStatement #elseStatement)
]

{ #category : #generated }
CSIfStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSIfStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSIfStatementNode >> thenStatement [
	^ thenStatement
]

{ #category : #generated }
CSIfStatementNode >> thenStatement: aCSStatementNode [
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: nil ].
	thenStatement := aCSStatementNode.
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: self ]
]

{ #category : #generated }
CSIfStatementNode >> tokenVariables [
	^ #(#ifToken #leftParenToken #rightParenToken #elseToken)
]
