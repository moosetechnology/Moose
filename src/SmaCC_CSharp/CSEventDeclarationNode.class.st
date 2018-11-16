Class {
	#name : #CSEventDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'eventToken',
		'type',
		'declarators',
		'commaTokens',
		'semicolonToken',
		'name',
		'interface',
		'periodToken',
		'leftBraceToken',
		'addDeclaration',
		'removeDeclaration',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSEventDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSEventDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSEventDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEventDeclaration: self
]

{ #category : #generated }
CSEventDeclarationNode >> addDeclaration [
	^ addDeclaration
]

{ #category : #generated }
CSEventDeclarationNode >> addDeclaration: aCSAddAccessorDeclarationNode [
	self addDeclaration notNil
		ifTrue: [ self addDeclaration parent: nil ].
	addDeclaration := aCSAddAccessorDeclarationNode.
	self addDeclaration notNil
		ifTrue: [ self addDeclaration parent: self ]
]

{ #category : #generated }
CSEventDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSEventDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSEventDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #declarators)
]

{ #category : #generated }
CSEventDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSEventDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSEventDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSEventDeclarationNode >> eventToken [
	^ eventToken
]

{ #category : #generated }
CSEventDeclarationNode >> eventToken: aSmaCCToken [
	eventToken := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CSEventDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSEventDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSEventDeclarationNode >> interface [
	^ interface
]

{ #category : #generated }
CSEventDeclarationNode >> interface: aCSTypeNode [
	self interface notNil
		ifTrue: [ self interface parent: nil ].
	interface := aCSTypeNode.
	self interface notNil
		ifTrue: [ self interface parent: self ]
]

{ #category : #generated }
CSEventDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSEventDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSEventDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSEventDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSEventDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> nodeVariables [
	^ #(#type #interface #addDeclaration #removeDeclaration)
]

{ #category : #generated }
CSEventDeclarationNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSEventDeclarationNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> removeDeclaration [
	^ removeDeclaration
]

{ #category : #generated }
CSEventDeclarationNode >> removeDeclaration: aCSRemoveAccessorDeclarationNode [
	self removeDeclaration notNil
		ifTrue: [ self removeDeclaration parent: nil ].
	removeDeclaration := aCSRemoveAccessorDeclarationNode.
	self removeDeclaration notNil
		ifTrue: [ self removeDeclaration parent: self ]
]

{ #category : #generated }
CSEventDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSEventDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSEventDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSEventDeclarationNode >> tokenVariables [
	^ #(#eventToken #name #periodToken #leftBraceToken #rightBraceToken)
]

{ #category : #generated }
CSEventDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSEventDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
