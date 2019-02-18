Class {
	#name : #JavaUnaryExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryExpression: self
]

{ #category : #generated }
JavaUnaryExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaUnaryExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaUnaryExpressionNode >> nodeVariables [
	^ #(#expression)
]
