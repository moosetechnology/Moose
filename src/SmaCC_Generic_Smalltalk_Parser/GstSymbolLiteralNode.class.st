Class {
	#name : #GstSymbolLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstSymbolLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSymbolLiteral: self
]

{ #category : #generated }
GstSymbolLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstSymbolLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstSymbolLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
