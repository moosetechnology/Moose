Class {
	#name : #GstStringLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstStringLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteral: self
]

{ #category : #generated }
GstStringLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstStringLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstStringLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
