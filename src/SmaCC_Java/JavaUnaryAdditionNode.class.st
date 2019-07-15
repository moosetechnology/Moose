Class {
	#name : #JavaUnaryAdditionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'plus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryAdditionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryAddition: self
]

{ #category : #generated }
JavaUnaryAdditionNode >> plus [
	^ plus
]

{ #category : #generated }
JavaUnaryAdditionNode >> plus: aSmaCCToken [
	plus := aSmaCCToken
]

{ #category : #generated }
JavaUnaryAdditionNode >> tokenVariables [
	^ #(#plus)
]
