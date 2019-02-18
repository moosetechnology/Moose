Class {
	#name : #JavaPreIncrementExpressionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'plusPlus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPreIncrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPreIncrementExpression: self
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> plusPlus [
	^ plusPlus
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> plusPlus: aSmaCCToken [
	plusPlus := aSmaCCToken
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> tokenVariables [
	^ #(#plusPlus)
]
