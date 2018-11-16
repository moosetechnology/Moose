Class {
	#name : #CSInterfaceMethodDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifier',
		'type',
		'name',
		'typeParameters',
		'leftParen',
		'parameters',
		'commas',
		'rightParen',
		'constraintClauses',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceMethodDeclaration: self
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #parameters #constraintClauses)
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> constraintClauses [
	^ constraintClauses
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> constraintClauses: anOrderedCollection [
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self
]

{ #category : #'generated-initialize-release' }
CSInterfaceMethodDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constraintClauses := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> nodeVariables [
	^ #(#type #typeParameters)
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> tokenVariables [
	^ #(#modifier #name #leftParen #rightParen #semicolon)
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
CSInterfaceMethodDeclarationNode >> typeParameters: aCSTypeParameterListNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
