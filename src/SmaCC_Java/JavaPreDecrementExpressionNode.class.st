Class {
	#name : #JavaPreDecrementExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'minusMinus',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPreDecrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPreDecrementExpression: self
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> minusMinus [
	^ minusMinus
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> minusMinus: aSmaCCToken [
	minusMinus := aSmaCCToken
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaPreDecrementExpressionNode >> tokenVariables [
	^ #(#minusMinus)
]
