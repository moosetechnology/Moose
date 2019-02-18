Class {
	#name : #JavaVariableArgumentParameterNode,
	#superclass : #JavaParameterNode,
	#instVars : [
		'varArgsToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaVariableArgumentParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableArgumentParameter: self
]

{ #category : #generated }
JavaVariableArgumentParameterNode >> tokenVariables [
	^ #(#varArgsToken)
]

{ #category : #generated }
JavaVariableArgumentParameterNode >> varArgsToken [
	^ varArgsToken
]

{ #category : #generated }
JavaVariableArgumentParameterNode >> varArgsToken: aSmaCCToken [
	varArgsToken := aSmaCCToken
]
