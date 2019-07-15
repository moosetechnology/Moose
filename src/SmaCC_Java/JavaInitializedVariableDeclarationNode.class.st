Class {
	#name : #JavaInitializedVariableDeclarationNode,
	#superclass : #JavaVariableDeclarationNode,
	#instVars : [
		'equals',
		'initializer'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInitializedVariableDeclaration: self
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> equals [
	^ equals
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> equals: aSmaCCToken [
	equals := aSmaCCToken
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> initializer [
	^ initializer
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> initializer: aJavaProgramNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aJavaProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> nodeVariables [
	^ #(#initializer #variable)
]

{ #category : #generated }
JavaInitializedVariableDeclarationNode >> tokenVariables [
	^ #(#equals)
]
