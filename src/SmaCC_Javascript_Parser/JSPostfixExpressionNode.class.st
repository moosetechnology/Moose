Class {
	#name : #JSPostfixExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'operator'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSPostfixExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostfixExpression: self
]

{ #category : #generated }
JSPostfixExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSPostfixExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSPostfixExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSPostfixExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
JSPostfixExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
JSPostfixExpressionNode >> tokenVariables [
	^ #(#operator)
]
