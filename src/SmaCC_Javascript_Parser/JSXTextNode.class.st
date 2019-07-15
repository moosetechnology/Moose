Class {
	#name : #JSXTextNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXTextNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXText: self
]

{ #category : #generated }
JSXTextNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
JSXTextNode >> value [
	^ value
]

{ #category : #generated }
JSXTextNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
