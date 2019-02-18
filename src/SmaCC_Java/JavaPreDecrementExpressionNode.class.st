Class {
	#name : #JavaPreDecrementExpressionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'minusMinus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPreDecrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPreDecrementExpression: self
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
JavaPreDecrementExpressionNode >> tokenVariables [
	^ #(#minusMinus)
]
