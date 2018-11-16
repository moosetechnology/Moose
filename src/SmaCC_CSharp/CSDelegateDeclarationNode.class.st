Class {
	#name : #CSDelegateDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'delegateToken',
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
CSDelegateDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSDelegateDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSDelegateDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDelegateDeclaration: self
]

{ #category : #generated }
CSDelegateDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSDelegateDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSDelegateDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #parameters #constraintClauses)
]

{ #category : #generated }
CSDelegateDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSDelegateDeclarationNode >> constraintClauses [
	^ constraintClauses
]

{ #category : #generated }
CSDelegateDeclarationNode >> constraintClauses: anOrderedCollection [
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self
]

{ #category : #generated }
CSDelegateDeclarationNode >> delegateToken [
	^ delegateToken
]

{ #category : #generated }
CSDelegateDeclarationNode >> delegateToken: aSmaCCToken [
	delegateToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
CSDelegateDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constraintClauses := OrderedCollection new: 2.
]

{ #category : #generated }
CSDelegateDeclarationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
CSDelegateDeclarationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
CSDelegateDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSDelegateDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSDelegateDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSDelegateDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSDelegateDeclarationNode >> nodeVariables [
	^ #(#type #typeParameters)
]

{ #category : #generated }
CSDelegateDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSDelegateDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSDelegateDeclarationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
CSDelegateDeclarationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
CSDelegateDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSDelegateDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSDelegateDeclarationNode >> tokenVariables [
	^ #(#delegateToken #name #leftParen #rightParen #semicolon)
]

{ #category : #generated }
CSDelegateDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSDelegateDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
CSDelegateDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
CSDelegateDeclarationNode >> typeParameters: aCSVariantTypeParameterListNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSVariantTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
