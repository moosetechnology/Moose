Class {
	#name : #CSRemoveAccessorDeclarationNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'removeToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRemoveAccessorDeclaration: self
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> block [
	^ block
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #'generated-initialize-release' }
CSRemoveAccessorDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> removeToken [
	^ removeToken
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> removeToken: aSmaCCToken [
	removeToken := aSmaCCToken
]

{ #category : #generated }
CSRemoveAccessorDeclarationNode >> tokenVariables [
	^ #(#removeToken)
]
