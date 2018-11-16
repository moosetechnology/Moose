Class {
	#name : #JavaInterfaceNode,
	#superclass : #JavaProgramNode,
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
JavaInterfaceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterface: self
]

{ #category : #generated }
JavaInterfaceNode >> commas [
	^ commas
]

{ #category : #generated }
JavaInterfaceNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaInterfaceNode >> compositeNodeVariables [
	^ #(#modifiers #interfaceTypes #declarations)
]

{ #category : #generated }
JavaInterfaceNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaInterfaceNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaInterfaceNode >> extendsToken [
	^ extendsToken
]

{ #category : #generated }
JavaInterfaceNode >> extendsToken: aSmaCCToken [
	extendsToken := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaInterfaceNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaInterfaceNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	interfaceTypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaInterfaceNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
JavaInterfaceNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceNode >> interfaceTypes [
	^ interfaceTypes
]

{ #category : #generated }
JavaInterfaceNode >> interfaceTypes: anOrderedCollection [
	self setParents: self interfaceTypes to: nil.
	interfaceTypes := anOrderedCollection.
	self setParents: self interfaceTypes to: self
]

{ #category : #generated }
JavaInterfaceNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaInterfaceNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaInterfaceNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaInterfaceNode >> name [
	^ name
]

{ #category : #generated }
JavaInterfaceNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceNode >> nodeVariables [
	^ #(#typeParameters)
]

{ #category : #generated }
JavaInterfaceNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaInterfaceNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaInterfaceNode >> tokenVariables [
	^ #(#interfaceToken #name #extendsToken)
]

{ #category : #generated }
JavaInterfaceNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaInterfaceNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
