Class {
	#name : #CSInterfacePropertyDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifier',
		'type',
		'name',
		'leftBrace',
		'getAccessor',
		'setAccessor',
		'rightBrace'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfacePropertyDeclaration: self
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> getAccessor [
	^ getAccessor
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> getAccessor: aCSInterfacePropertyAccessorNode [
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: nil ].
	getAccessor := aCSInterfacePropertyAccessorNode.
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: self ]
]

{ #category : #'generated-initialize-release' }
CSInterfacePropertyDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> nodeVariables [
	^ #(#type #getAccessor #setAccessor)
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> setAccessor [
	^ setAccessor
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> setAccessor: aCSInterfacePropertyAccessorNode [
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: nil ].
	setAccessor := aCSInterfacePropertyAccessorNode.
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: self ]
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> tokenVariables [
	^ #(#modifier #name #leftBrace #rightBrace)
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSInterfacePropertyDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
