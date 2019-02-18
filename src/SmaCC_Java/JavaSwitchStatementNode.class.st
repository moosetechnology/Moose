Class {
	#name : #JavaSwitchStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'switchToken',
		'leftParen',
		'expression',
		'rightParen',
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSwitchStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchStatement: self
]

{ #category : #generated }
JavaSwitchStatementNode >> block [
	^ block
]

{ #category : #generated }
JavaSwitchStatementNode >> block: aJavaSwitchBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaSwitchBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaSwitchStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaSwitchStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaSwitchStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaSwitchStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaSwitchStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaSwitchStatementNode >> nodeVariables [
	^ #(#expression #block)
]

{ #category : #generated }
JavaSwitchStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaSwitchStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaSwitchStatementNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
JavaSwitchStatementNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
JavaSwitchStatementNode >> tokenVariables [
	^ #(#switchToken)
]
