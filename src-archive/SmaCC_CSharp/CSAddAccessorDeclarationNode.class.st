Class {
	#name : #CSAddAccessorDeclarationNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'addToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAddAccessorDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAddAccessorDeclaration: self
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> addToken [
	^ addToken
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> addToken: aSmaCCToken [
	addToken := aSmaCCToken
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> block [
	^ block
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #'generated-initialize-release' }
CSAddAccessorDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSAddAccessorDeclarationNode >> tokenVariables [
	^ #(#addToken)
]
