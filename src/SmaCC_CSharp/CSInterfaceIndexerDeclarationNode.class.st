Class {
	#name : #CSInterfaceIndexerDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifier',
		'type',
		'thisToken',
		'leftBracket',
		'parameters',
		'commas',
		'rightBracket',
		'leftBrace',
		'getAccessor',
		'setAccessor',
		'rightBrace'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceIndexerDeclaration: self
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #parameters)
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> getAccessor [
	^ getAccessor
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> getAccessor: aCSInterfacePropertyAccessorNode [
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: nil ].
	getAccessor := aCSInterfacePropertyAccessorNode.
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: self ]
]

{ #category : #'generated-initialize-release' }
CSInterfaceIndexerDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> nodeVariables [
	^ #(#type #getAccessor #setAccessor)
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> setAccessor [
	^ setAccessor
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> setAccessor: aCSInterfacePropertyAccessorNode [
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: nil ].
	setAccessor := aCSInterfacePropertyAccessorNode.
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: self ]
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> tokenVariables [
	^ #(#modifier #thisToken #leftBracket #rightBracket #leftBrace #rightBrace)
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSInterfaceIndexerDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
