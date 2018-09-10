Class {
	#name : #JSUnaryExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'operator',
		'expression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSUnaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryExpression: self
]

{ #category : #generated }
JSUnaryExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSUnaryExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSUnaryExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSUnaryExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
JSUnaryExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
JSUnaryExpressionNode >> tokenVariables [
	^ #(#operator)
]
