Class {
	#name : #JSSetMethodDefinitionNode,
	#superclass : #JSMethodDefinitionNode,
	#instVars : [
		'setToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSSetMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetMethodDefinition: self
]

{ #category : #generated }
JSSetMethodDefinitionNode >> setToken [
	^ setToken
]

{ #category : #generated }
JSSetMethodDefinitionNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
JSSetMethodDefinitionNode >> tokenVariables [
	^ #(#setToken)
]
