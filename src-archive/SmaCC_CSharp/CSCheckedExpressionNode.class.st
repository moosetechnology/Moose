Class {
	#name : #CSCheckedExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'checkedToken',
		'leftParenToken',
		'expression',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCheckedExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCheckedExpression: self
]

{ #category : #generated }
CSCheckedExpressionNode >> checkedToken [
	^ checkedToken
]

{ #category : #generated }
CSCheckedExpressionNode >> checkedToken: aSmaCCToken [
	checkedToken := aSmaCCToken
]

{ #category : #generated }
CSCheckedExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSCheckedExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSCheckedExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSCheckedExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSCheckedExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSCheckedExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSCheckedExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSCheckedExpressionNode >> tokenVariables [
	^ #(#checkedToken #leftParenToken #rightParenToken)
]
