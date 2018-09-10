Class {
	#name : #CSDeclarationStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'declaration',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDeclarationStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDeclarationStatement: self
]

{ #category : #generated }
CSDeclarationStatementNode >> declaration [
	^ declaration
]

{ #category : #generated }
CSDeclarationStatementNode >> declaration: aCSDeclarationNode [
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aCSDeclarationNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]
]

{ #category : #generated }
CSDeclarationStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSDeclarationStatementNode >> nodeVariables [
	^ #(#declaration)
]

{ #category : #generated }
CSDeclarationStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSDeclarationStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]
