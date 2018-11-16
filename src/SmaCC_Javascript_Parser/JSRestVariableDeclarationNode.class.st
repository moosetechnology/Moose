Class {
	#name : #JSRestVariableDeclarationNode,
	#superclass : #JSVariableDeclarationNode,
	#instVars : [
		'ellipsis'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSRestVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRestVariableDeclaration: self
]

{ #category : #generated }
JSRestVariableDeclarationNode >> ellipsis [
	^ ellipsis
]

{ #category : #generated }
JSRestVariableDeclarationNode >> ellipsis: aSmaCCToken [
	ellipsis := aSmaCCToken
]

{ #category : #generated }
JSRestVariableDeclarationNode >> tokenVariables [
	^ #(#ellipsis #equalToken)
]
