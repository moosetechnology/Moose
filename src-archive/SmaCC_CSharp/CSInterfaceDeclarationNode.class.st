Class {
	#name : #CSInterfaceDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'partialToken',
		'interfaceToken',
		'name',
		'typeParameters',
		'colon',
		'supertypes',
		'commas',
		'constraintClauses',
		'leftBrace',
		'declarations',
		'rightBrace',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfaceDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfaceDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfaceDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceDeclaration: self
]

{ #category : #generated }
CSInterfaceDeclarationNode >> colon [
	^ colon
]

{ #category : #generated }
CSInterfaceDeclarationNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSInterfaceDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSInterfaceDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #supertypes #constraintClauses #declarations)
]

{ #category : #generated }
CSInterfaceDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSInterfaceDeclarationNode >> constraintClauses [
	^ constraintClauses
]

{ #category : #generated }
CSInterfaceDeclarationNode >> constraintClauses: anOrderedCollection [
	self setParents: self constraintClauses to: nil.
	constraintClauses := anOrderedCollection.
	self setParents: self constraintClauses to: self
]

{ #category : #generated }
CSInterfaceDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSInterfaceDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #'generated-initialize-release' }
CSInterfaceDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	supertypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constraintClauses := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfaceDeclarationNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
CSInterfaceDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSInterfaceDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSInterfaceDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSInterfaceDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> nodeVariables [
	^ #(#typeParameters)
]

{ #category : #generated }
CSInterfaceDeclarationNode >> partialToken [
	^ partialToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> partialToken: aSmaCCToken [
	partialToken := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
CSInterfaceDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSInterfaceDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSInterfaceDeclarationNode >> supertypes [
	^ supertypes
]

{ #category : #generated }
CSInterfaceDeclarationNode >> supertypes: anOrderedCollection [
	self setParents: self supertypes to: nil.
	supertypes := anOrderedCollection.
	self setParents: self supertypes to: self
]

{ #category : #generated }
CSInterfaceDeclarationNode >> tokenVariables [
	^ #(#partialToken #interfaceToken #name #colon #leftBrace #rightBrace #semicolon)
]

{ #category : #generated }
CSInterfaceDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
CSInterfaceDeclarationNode >> typeParameters: aCSVariantTypeParameterListNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aCSVariantTypeParameterListNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
