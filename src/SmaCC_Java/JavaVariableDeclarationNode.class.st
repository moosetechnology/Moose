Class {
	#name : #JavaVariableDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'variable'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableDeclaration: self
]

{ #category : #generated }
JavaVariableDeclarationNode >> nodeVariables [
	^ #(#variable)
]

{ #category : #generated }
JavaVariableDeclarationNode >> variable [
	^ variable
]

{ #category : #generated }
JavaVariableDeclarationNode >> variable: aJavaProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
