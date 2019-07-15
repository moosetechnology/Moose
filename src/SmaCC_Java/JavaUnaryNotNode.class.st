Class {
	#name : #JavaUnaryNotNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'bang'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryNotNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryNot: self
]

{ #category : #generated }
JavaUnaryNotNode >> bang [
	^ bang
]

{ #category : #generated }
JavaUnaryNotNode >> bang: aSmaCCToken [
	bang := aSmaCCToken
]

{ #category : #generated }
JavaUnaryNotNode >> tokenVariables [
	^ #(#bang)
]
