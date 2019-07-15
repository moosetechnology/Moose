Class {
	#name : #JavaPostDecrementExpressionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'minusMinus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPostDecrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostDecrementExpression: self
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
JavaPostDecrementExpressionNode >> tokenVariables [
	^ #(#minusMinus)
]
