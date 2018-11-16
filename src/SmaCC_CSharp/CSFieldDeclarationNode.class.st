Class {
	#name : #CSFieldDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'type',
		'declarators',
		'commaTokens',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFieldDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSFieldDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSFieldDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFieldDeclaration: self
]

{ #category : #generated }
CSFieldDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSFieldDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSFieldDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #declarators)
]

{ #category : #generated }
CSFieldDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSFieldDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSFieldDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSFieldDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CSFieldDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSFieldDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSFieldDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSFieldDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSFieldDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSFieldDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSFieldDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSFieldDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSFieldDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
