Class {
	#name : #GstBooleanLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstBooleanLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanLiteral: self
]

{ #category : #generated }
GstBooleanLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstBooleanLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstBooleanLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
