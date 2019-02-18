Class {
	#name : #JavaInterfaceDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'interfaceToken',
		'name',
		'typeParameters',
		'extendsToken',
		'interfaceTypes',
		'commas',
		'leftBrace',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaInterfaceDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceDeclaration: self
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #interfaceTypes #declarations)
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> extendsToken [
	^ extendsToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> extendsToken: aSmaCCToken [
	extendsToken := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaInterfaceDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	interfaceTypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> interfaceTypes [
	^ interfaceTypes
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> interfaceTypes: anOrderedCollection [
	self setParents: self interfaceTypes to: nil.
	interfaceTypes := anOrderedCollection.
	self setParents: self interfaceTypes to: self
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> nodeVariables [
	^ #(#typeParameters)
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> tokenVariables [
	^ #(#interfaceToken #name #extendsToken)
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaInterfaceDeclarationNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
