Class {
	#name : #JavaSynchronizedStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'synchronizedToken',
		'leftParen',
		'expression',
		'rightParen',
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSynchronizedStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSynchronizedStatement: self
]

{ #category : #generated }
JavaSynchronizedStatementNode >> block [
	^ block
]

{ #category : #generated }
JavaSynchronizedStatementNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaSynchronizedStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaSynchronizedStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaSynchronizedStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaSynchronizedStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaSynchronizedStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaSynchronizedStatementNode >> nodeVariables [
	^ #(#expression #block)
]

{ #category : #generated }
JavaSynchronizedStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaSynchronizedStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaSynchronizedStatementNode >> synchronizedToken [
	^ synchronizedToken
]

{ #category : #generated }
JavaSynchronizedStatementNode >> synchronizedToken: aSmaCCToken [
	synchronizedToken := aSmaCCToken
]

{ #category : #generated }
JavaSynchronizedStatementNode >> tokenVariables [
	^ #(#synchronizedToken)
]
