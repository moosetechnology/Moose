Class {
	#name : #JavaPostIncrementExpressionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'plusPlus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPostIncrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostIncrementExpression: self
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> plusPlus [
	^ plusPlus
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> plusPlus: aSmaCCToken [
	plusPlus := aSmaCCToken
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> tokenVariables [
	^ #(#plusPlus)
]
