Class {
	#name : #CSIndexerDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'returnType',
		'thisToken',
		'leftBracketToken',
		'parameters',
		'commas',
		'rightBracketToken',
		'type',
		'periodToken',
		'leftBraceToken',
		'getAccessor',
		'setAccessor',
		'rightBraceToken',
		'equalGreaterThanToken',
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSIndexerDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSIndexerDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSIndexerDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIndexerDeclaration: self
]

{ #category : #generated }
CSIndexerDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
CSIndexerDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSIndexerDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes #parameters)
]

{ #category : #generated }
CSIndexerDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers #commas)
]

{ #category : #generated }
CSIndexerDeclarationNode >> equalGreaterThanToken [
	^ equalGreaterThanToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> equalGreaterThanToken: aSmaCCToken [
	equalGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> expression [
	^ expression
]

{ #category : #generated }
CSIndexerDeclarationNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSIndexerDeclarationNode >> getAccessor [
	^ getAccessor
]

{ #category : #generated }
CSIndexerDeclarationNode >> getAccessor: aCSGetAccessorDeclarationNode [
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: nil ].
	getAccessor := aCSGetAccessorDeclarationNode.
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: self ]
]

{ #category : #generated }
CSIndexerDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSIndexerDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSIndexerDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSIndexerDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSIndexerDeclarationNode >> nodeVariables [
	^ #(#returnType #type #getAccessor #setAccessor #expression)
]

{ #category : #generated }
CSIndexerDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSIndexerDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSIndexerDeclarationNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> returnType [
	^ returnType
]

{ #category : #generated }
CSIndexerDeclarationNode >> returnType: aCSTypeNode [
	self returnType notNil
		ifTrue: [ self returnType parent: nil ].
	returnType := aCSTypeNode.
	self returnType notNil
		ifTrue: [ self returnType parent: self ]
]

{ #category : #generated }
CSIndexerDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> setAccessor [
	^ setAccessor
]

{ #category : #generated }
CSIndexerDeclarationNode >> setAccessor: aCSSetAccessorDeclarationNode [
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: nil ].
	setAccessor := aCSSetAccessorDeclarationNode.
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: self ]
]

{ #category : #generated }
CSIndexerDeclarationNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
CSIndexerDeclarationNode >> tokenVariables [
	^ #(#thisToken #leftBracketToken #rightBracketToken #periodToken #leftBraceToken #rightBraceToken #equalGreaterThanToken)
]

{ #category : #generated }
CSIndexerDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSIndexerDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
