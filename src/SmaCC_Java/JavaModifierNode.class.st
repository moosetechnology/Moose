Class {
	#name : #JavaModifierNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'token'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaModifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModifier: self
]

{ #category : #generated }
JavaModifierNode >> token [
	^ token
]

{ #category : #generated }
JavaModifierNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
JavaModifierNode >> tokenVariables [
	^ #(#token)
]
