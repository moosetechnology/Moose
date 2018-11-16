Class {
	#name : #CSConstantDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'constToken',
		'type',
		'declarators',
		'commaTokens',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstantDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSConstantDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSConstantDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantDeclaration: self
]

{ #category : #generated }
CSConstantDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSConstantDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSConstantDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #declarators)
]

{ #category : #generated }
CSConstantDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSConstantDeclarationNode >> constToken [
	^ constToken
]

{ #category : #generated }
CSConstantDeclarationNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
CSConstantDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSConstantDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSConstantDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CSConstantDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSConstantDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSConstantDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSConstantDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSConstantDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSConstantDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSConstantDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSConstantDeclarationNode >> tokenVariables [
	^ #(#constToken)
]

{ #category : #generated }
CSConstantDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSConstantDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
