Class {
	#name : #GstNumberLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstNumberLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNumberLiteral: self
]

{ #category : #generated }
GstNumberLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstNumberLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstNumberLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
