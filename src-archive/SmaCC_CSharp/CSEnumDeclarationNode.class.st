Class {
	#name : #CSEnumDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'enumToken',
		'name',
		'colonToken',
		'type',
		'leftBrace',
		'declarations',
		'commas',
		'rightBrace',
		'semicolon',
		'equal',
		'value'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSEnumDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSEnumDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSEnumDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEnumDeclaration: self
]

{ #category : #generated }
CSEnumDeclarationNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSEnumDeclarationNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSEnumDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSEnumDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #declarations)
]

{ #category : #generated }
CSEnumDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSEnumDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSEnumDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
CSEnumDeclarationNode >> enumToken [
	^ enumToken
]

{ #category : #generated }
CSEnumDeclarationNode >> enumToken: aSmaCCToken [
	enumToken := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> equal [
	^ equal
]

{ #category : #generated }
CSEnumDeclarationNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
CSEnumDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSEnumDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
CSEnumDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSEnumDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSEnumDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSEnumDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
CSEnumDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
CSEnumDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSEnumDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> tokenVariables [
	^ #(#enumToken #name #colonToken #type #leftBrace #rightBrace #semicolon #equal)
]

{ #category : #generated }
CSEnumDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSEnumDeclarationNode >> type: aSmaCCToken [
	type := aSmaCCToken
]

{ #category : #generated }
CSEnumDeclarationNode >> value [
	^ value
]

{ #category : #generated }
CSEnumDeclarationNode >> value: aCSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aCSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
