Class {
	#name : #CSClassDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'partialToken',
		'classToken',
		'name',
		'typeParameters',
		'colonToken',
		'supertypes',
		'commas',
		'commaToken',
		'constraintClauses',
		'leftBraceToken',
		'declarations',
		'rightBraceToken',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSClassDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSClassDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSClassDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassDeclaration: self
]

{ #category : #generated }
CSClassDeclarationNode >> classToken [
	^ classToken
]

{ #category : #generated }
CSClassDeclarationNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSClassDeclarationNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
CSClassDeclarationNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSClassDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSClassDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #supertypes #constraintClauses #declarations)
]

{ #category : #generated }
CSClassDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSClassDeclarationNode >> constraintClauses [
	^ constraintClauses
]

{ #category : #generated }
CSClassDeclarationNode >> constraintClauses: anOrderedCollection [
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self
]

{ #category : #generated }
CSClassDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSClassDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
CSClassDeclarationNode >> ignoredTokenVariables [
	^ #(#commaToken)
]

{ #category : #'generated-initialize-release' }
CSClassDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	supertypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constraintClauses := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
CSClassDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSClassDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSClassDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSClassDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSClassDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> nodeVariables [
	^ #(#typeParameters)
]

{ #category : #generated }
CSClassDeclarationNode >> partialToken [
	^ partialToken
]

{ #category : #generated }
CSClassDeclarationNode >> partialToken: aSmaCCToken [
	partialToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSClassDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSClassDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSClassDeclarationNode >> supertypes [
	^ supertypes
]

{ #category : #generated }
CSClassDeclarationNode >> supertypes: anOrderedCollection [
	self setParents: self supertypes to: nil.
	supertypes := anOrderedCollection.
	self setParents: self supertypes to: self
]

{ #category : #generated }
CSClassDeclarationNode >> tokenVariables [
	^ #(#partialToken #classToken #name #colonToken #leftBraceToken #rightBraceToken #semicolon)
]

{ #category : #generated }
CSClassDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
CSClassDeclarationNode >> typeParameters: aCSTypeParameterListNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
