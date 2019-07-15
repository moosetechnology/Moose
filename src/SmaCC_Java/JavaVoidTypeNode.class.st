Class {
	#name : #JavaVoidTypeNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'voidToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaVoidTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVoidType: self
]

{ #category : #generated }
JavaVoidTypeNode >> tokenVariables [
	^ #(#voidToken)
]

{ #category : #generated }
JavaVoidTypeNode >> voidToken [
	^ voidToken
]

{ #category : #generated }
JavaVoidTypeNode >> voidToken: aSmaCCToken [
	voidToken := aSmaCCToken
]
