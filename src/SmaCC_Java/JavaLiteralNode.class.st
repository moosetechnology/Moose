Class {
	#name : #JavaLiteralNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'token'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteral: self
]

{ #category : #generated }
JavaLiteralNode >> token [
	^ token
]

{ #category : #generated }
JavaLiteralNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
JavaLiteralNode >> tokenVariables [
	^ #(#token)
]
