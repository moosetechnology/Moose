Class {
	#name : #JSLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteral: self
]

{ #category : #generated }
JSLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
JSLiteralNode >> value [
	^ value
]

{ #category : #generated }
JSLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
