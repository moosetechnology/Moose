Class {
	#name : #JSVariableDeclarationNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'variable',
		'equalToken',
		'value'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableDeclaration: self
]

{ #category : #generated }
JSVariableDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
JSVariableDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
JSVariableDeclarationNode >> nodeVariables [
	^ #(#variable #value)
]

{ #category : #generated }
JSVariableDeclarationNode >> tokenVariables [
	^ #(#equalToken)
]

{ #category : #generated }
JSVariableDeclarationNode >> value [
	^ value
]

{ #category : #generated }
JSVariableDeclarationNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]

{ #category : #generated }
JSVariableDeclarationNode >> variable [
	^ variable
]

{ #category : #generated }
JSVariableDeclarationNode >> variable: aJSProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJSProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
