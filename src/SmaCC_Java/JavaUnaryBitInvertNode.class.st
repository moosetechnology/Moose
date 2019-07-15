Class {
	#name : #JavaUnaryBitInvertNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'tilde'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryBitInvertNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryBitInvert: self
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tilde [
	^ tilde
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tilde: aSmaCCToken [
	tilde := aSmaCCToken
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tokenVariables [
	^ #(#tilde)
]
