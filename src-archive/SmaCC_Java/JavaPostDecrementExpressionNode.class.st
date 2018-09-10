Class {
	#name : #JavaPostDecrementExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'expression',
		'minusMinus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPostDecrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostDecrementExpression: self
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> minusMinus [
	^ minusMinus
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> minusMinus: aSmaCCToken [
	minusMinus := aSmaCCToken
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaPostDecrementExpressionNode >> tokenVariables [
	^ #(#minusMinus)
]
