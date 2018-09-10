Class {
	#name : #GstNilLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstNilLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNilLiteral: self
]

{ #category : #generated }
GstNilLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstNilLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstNilLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
