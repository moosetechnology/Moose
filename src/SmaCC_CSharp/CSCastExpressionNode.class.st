Class {
	#name : #CSCastExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'leftParenToken',
		'type',
		'rightParenToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCastExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCastExpression: self
]

{ #category : #generated }
CSCastExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSCastExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSCastExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSCastExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSCastExpressionNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
CSCastExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSCastExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSCastExpressionNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]

{ #category : #generated }
CSCastExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSCastExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
