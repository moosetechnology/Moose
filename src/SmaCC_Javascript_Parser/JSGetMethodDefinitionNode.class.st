Class {
	#name : #JSGetMethodDefinitionNode,
	#superclass : #JSMethodDefinitionNode,
	#instVars : [
		'getToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSGetMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGetMethodDefinition: self
]

{ #category : #generated }
JSGetMethodDefinitionNode >> getToken [
	^ getToken
]

{ #category : #generated }
JSGetMethodDefinitionNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
JSGetMethodDefinitionNode >> tokenVariables [
	^ #(#getToken)
]
