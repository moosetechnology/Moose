Class {
	#name : #JavaEnumDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'enumToken',
		'name',
		'implementsToken',
		'interfaces',
		'commas',
		'leftBrace',
		'constants',
		'semicolon',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaEnumDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEnumDeclaration: self
]

{ #category : #generated }
JavaEnumDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaEnumDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaEnumDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #interfaces #constants #declarations)
]

{ #category : #generated }
JavaEnumDeclarationNode >> constants [
	^ constants
]

{ #category : #generated }
JavaEnumDeclarationNode >> constants: anOrderedCollection [
	self setParents: self constants to: nil.
	constants := anOrderedCollection.
	self setParents: self constants to: self
]

{ #category : #generated }
JavaEnumDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaEnumDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaEnumDeclarationNode >> enumToken [
	^ enumToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> enumToken: aSmaCCToken [
	enumToken := aSmaCCToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaEnumDeclarationNode >> ignoredTokenVariables [
	^ #(#leftBrace #semicolon #rightBrace)
]

{ #category : #generated }
JavaEnumDeclarationNode >> implementsToken [
	^ implementsToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> implementsToken: aSmaCCToken [
	implementsToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
JavaEnumDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	interfaces := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	constants := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaEnumDeclarationNode >> interfaces [
	^ interfaces
]

{ #category : #generated }
JavaEnumDeclarationNode >> interfaces: anOrderedCollection [
	self setParents: self interfaces to: nil.
	interfaces := anOrderedCollection.
	self setParents: self interfaces to: self
]

{ #category : #generated }
JavaEnumDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaEnumDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaEnumDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaEnumDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaEnumDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaEnumDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaEnumDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaEnumDeclarationNode >> tokenVariables [
	^ #(#enumToken #name #implementsToken)
]
