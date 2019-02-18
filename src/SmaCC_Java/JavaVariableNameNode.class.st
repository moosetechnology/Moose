Class {
	#name : #JavaVariableNameNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaVariableNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableName: self
]

{ #category : #generated }
JavaVariableNameNode >> name [
	^ name
]

{ #category : #generated }
JavaVariableNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaVariableNameNode >> tokenVariables [
	^ #(#name)
]
