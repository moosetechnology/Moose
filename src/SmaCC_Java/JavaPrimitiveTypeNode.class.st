Class {
	#name : #JavaPrimitiveTypeNode,
	#superclass : #JavaTypeNode,
	#instVars : [
		'token'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPrimitiveTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPrimitiveType: self
]

{ #category : #generated }
JavaPrimitiveTypeNode >> token [
	^ token
]

{ #category : #generated }
JavaPrimitiveTypeNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
JavaPrimitiveTypeNode >> tokenVariables [
	^ #(#token)
]
