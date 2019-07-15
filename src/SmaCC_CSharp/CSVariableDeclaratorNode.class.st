Class {
	#name : #CSVariableDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifierToken',
		'equalToken',
		'initializer'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSVariableDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableDeclarator: self
]

{ #category : #generated }
CSVariableDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSVariableDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSVariableDeclaratorNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSVariableDeclaratorNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSVariableDeclaratorNode >> initializer [
	^ initializer
]

{ #category : #generated }
CSVariableDeclaratorNode >> initializer: aCSProgramNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CSVariableDeclaratorNode >> nodeVariables [
	^ #(#initializer)
]

{ #category : #generated }
CSVariableDeclaratorNode >> tokenVariables [
	^ #(#identifierToken #equalToken)
]
