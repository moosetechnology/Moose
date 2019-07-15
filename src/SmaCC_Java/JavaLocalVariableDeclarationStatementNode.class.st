Class {
	#name : #JavaLocalVariableDeclarationStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'declaration',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLocalVariableDeclarationStatement: self
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> declaration [
	^ declaration
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> declaration: aJavaLocalVariableDeclarationNode [
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aJavaLocalVariableDeclarationNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> nodeVariables [
	^ #(#declaration)
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaLocalVariableDeclarationStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
