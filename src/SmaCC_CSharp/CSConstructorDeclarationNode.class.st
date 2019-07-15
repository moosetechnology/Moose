Class {
	#name : #CSConstructorDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'identifierToken',
		'leftParenToken',
		'parameters',
		'commas',
		'rightParenToken',
		'initializer',
		'block',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstructorDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSConstructorDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSConstructorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorDeclaration: self
]

{ #category : #generated }
CSConstructorDeclarationNode >> block [
	^ block
]

{ #category : #generated }
CSConstructorDeclarationNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSConstructorDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSConstructorDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSConstructorDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #parameters)
]

{ #category : #generated }
CSConstructorDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSConstructorDeclarationNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSConstructorDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSConstructorDeclarationNode >> initializer [
	^ initializer
]

{ #category : #generated }
CSConstructorDeclarationNode >> initializer: aCSConstructorInitializerNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSConstructorInitializerNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CSConstructorDeclarationNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSConstructorDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSConstructorDeclarationNode >> nodeVariables [
	^ #(#initializer #block)
]

{ #category : #generated }
CSConstructorDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSConstructorDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSConstructorDeclarationNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorDeclarationNode >> tokenVariables [
	^ #(#identifierToken #leftParenToken #rightParenToken)
]
