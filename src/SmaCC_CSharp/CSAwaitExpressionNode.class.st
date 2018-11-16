Class {
	#name : #CSAwaitExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'awaitToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAwaitExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAwaitExpression: self
]

{ #category : #generated }
CSAwaitExpressionNode >> awaitToken [
	^ awaitToken
]

{ #category : #generated }
CSAwaitExpressionNode >> awaitToken: aSmaCCToken [
	awaitToken := aSmaCCToken
]

{ #category : #generated }
CSAwaitExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSAwaitExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSAwaitExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSAwaitExpressionNode >> tokenVariables [
	^ #(#awaitToken)
]
