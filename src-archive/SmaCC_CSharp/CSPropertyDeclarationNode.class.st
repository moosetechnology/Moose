Class {
	#name : #CSPropertyDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'type',
		'name',
		'interface',
		'periodToken',
		'leftBraceToken',
		'getAccessor',
		'setAccessor',
		'rightBraceToken',
		'equalToken',
		'initializer',
		'equalGreaterThanToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPropertyDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSPropertyDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSPropertyDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyDeclaration: self
]

{ #category : #generated }
CSPropertyDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSPropertyDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSPropertyDeclarationNode >> equalGreaterThanToken [
	^ equalGreaterThanToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> equalGreaterThanToken: aSmaCCToken [
	equalGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> expression [
	^ expression
]

{ #category : #generated }
CSPropertyDeclarationNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSPropertyDeclarationNode >> getAccessor [
	^ getAccessor
]

{ #category : #generated }
CSPropertyDeclarationNode >> getAccessor: aCSGetAccessorDeclarationNode [
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: nil ].
	getAccessor := aCSGetAccessorDeclarationNode.
	self getAccessor notNil
		ifTrue: [ self getAccessor parent: self ]
]

{ #category : #'generated-initialize-release' }
CSPropertyDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CSPropertyDeclarationNode >> initializer [
	^ initializer
]

{ #category : #generated }
CSPropertyDeclarationNode >> initializer: aCSProgramNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CSPropertyDeclarationNode >> interface [
	^ interface
]

{ #category : #generated }
CSPropertyDeclarationNode >> interface: aCSTypeNode [
	self interface notNil
		ifTrue: [ self interface parent: nil ].
	interface := aCSTypeNode.
	self interface notNil
		ifTrue: [ self interface parent: self ]
]

{ #category : #generated }
CSPropertyDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSPropertyDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSPropertyDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSPropertyDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> nodeVariables [
	^ #(#type #interface #getAccessor #setAccessor #initializer #expression)
]

{ #category : #generated }
CSPropertyDeclarationNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSPropertyDeclarationNode >> setAccessor [
	^ setAccessor
]

{ #category : #generated }
CSPropertyDeclarationNode >> setAccessor: aCSSetAccessorDeclarationNode [
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: nil ].
	setAccessor := aCSSetAccessorDeclarationNode.
	self setAccessor notNil
		ifTrue: [ self setAccessor parent: self ]
]

{ #category : #generated }
CSPropertyDeclarationNode >> tokenVariables [
	^ #(#name #periodToken #leftBraceToken #rightBraceToken #equalToken #equalGreaterThanToken)
]

{ #category : #generated }
CSPropertyDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSPropertyDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
