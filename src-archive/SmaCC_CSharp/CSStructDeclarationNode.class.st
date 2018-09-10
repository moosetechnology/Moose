Class {
	#name : #CSStructDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'partialToken',
		'structToken',
		'identifierToken',
		'typeParameters',
		'colonToken',
		'supertypes',
		'commas',
		'constraintClauses',
		'leftBraceToken',
		'declarations',
		'rightBraceToken',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSStructDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSStructDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSStructDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStructDeclaration: self
]

{ #category : #generated }
CSStructDeclarationNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSStructDeclarationNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSStructDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSStructDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #supertypes #constraintClauses #declarations)
]

{ #category : #generated }
CSStructDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSStructDeclarationNode >> constraintClauses [
	^ constraintClauses
]

{ #category : #generated }
CSStructDeclarationNode >> constraintClauses: anOrderedCollection [
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self
]

{ #category : #generated }
CSStructDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSStructDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
CSStructDeclarationNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSStructDeclarationNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
CSStructDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	supertypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constraintClauses := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
CSStructDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSStructDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSStructDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSStructDeclarationNode >> nodeVariables [
	^ #(#typeParameters)
]

{ #category : #generated }
CSStructDeclarationNode >> partialToken [
	^ partialToken
]

{ #category : #generated }
CSStructDeclarationNode >> partialToken: aSmaCCToken [
	partialToken := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSStructDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSStructDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> structToken [
	^ structToken
]

{ #category : #generated }
CSStructDeclarationNode >> structToken: aSmaCCToken [
	structToken := aSmaCCToken
]

{ #category : #generated }
CSStructDeclarationNode >> supertypes [
	^ supertypes
]

{ #category : #generated }
CSStructDeclarationNode >> supertypes: anOrderedCollection [
	self setParents: self supertypes to: nil.
	supertypes := anOrderedCollection.
	self setParents: self supertypes to: self
]

{ #category : #generated }
CSStructDeclarationNode >> tokenVariables [
	^ #(#partialToken #structToken #identifierToken #colonToken #leftBraceToken #rightBraceToken #semicolon)
]

{ #category : #generated }
CSStructDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
CSStructDeclarationNode >> typeParameters: aCSTypeParameterListNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
