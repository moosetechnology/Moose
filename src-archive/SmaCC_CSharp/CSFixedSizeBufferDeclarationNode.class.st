Class {
	#name : #CSFixedSizeBufferDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'fixedToken',
		'type',
		'declarators',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFixedSizeBufferDeclaration: self
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #declarators)
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> fixedToken [
	^ fixedToken
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> fixedToken: aSmaCCToken [
	fixedToken := aSmaCCToken
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSFixedSizeBufferDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> tokenVariables [
	^ #(#fixedToken)
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSFixedSizeBufferDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
