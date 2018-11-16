Class {
	#name : #CSUncheckedExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'uncheckedToken',
		'leftParenToken',
		'expression',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUncheckedExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUncheckedExpression: self
]

{ #category : #generated }
CSUncheckedExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSUncheckedExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSUncheckedExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSUncheckedExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSUncheckedExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSUncheckedExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSUncheckedExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSUncheckedExpressionNode >> tokenVariables [
	^ #(#uncheckedToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSUncheckedExpressionNode >> uncheckedToken [
	^ uncheckedToken
]

{ #category : #generated }
CSUncheckedExpressionNode >> uncheckedToken: aSmaCCToken [
	uncheckedToken := aSmaCCToken
]
