Class {
	#name : #JavaArrayVariableNameNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'variable',
		'leftBracket',
		'rightBracket'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaArrayVariableNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayVariableName: self
]

{ #category : #generated }
JavaArrayVariableNameNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #generated }
JavaArrayVariableNameNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JavaArrayVariableNameNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JavaArrayVariableNameNode >> nodeVariables [
	^ #(#variable)
]

{ #category : #generated }
JavaArrayVariableNameNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JavaArrayVariableNameNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
JavaArrayVariableNameNode >> variable [
	^ variable
]

{ #category : #generated }
JavaArrayVariableNameNode >> variable: aJavaProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
