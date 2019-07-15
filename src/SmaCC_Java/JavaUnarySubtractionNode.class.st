Class {
	#name : #JavaUnarySubtractionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'minus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnarySubtractionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnarySubtraction: self
]

{ #category : #generated }
JavaUnarySubtractionNode >> minus [
	^ minus
]

{ #category : #generated }
JavaUnarySubtractionNode >> minus: aSmaCCToken [
	minus := aSmaCCToken
]

{ #category : #generated }
JavaUnarySubtractionNode >> tokenVariables [
	^ #(#minus)
]
