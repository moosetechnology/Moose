Class {
	#name : #JavaClassDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'classToken',
		'name',
		'typeParameters',
		'extendsToken',
		'superclass',
		'implementsToken',
		'interfaces',
		'commas',
		'leftBrace',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaClassDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassDeclaration: self
]

{ #category : #generated }
JavaClassDeclarationNode >> classToken [
	^ classToken
]

{ #category : #generated }
JavaClassDeclarationNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
JavaClassDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaClassDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaClassDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #interfaces #declarations)
]

{ #category : #generated }
JavaClassDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaClassDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaClassDeclarationNode >> extendsToken [
	^ extendsToken
]

{ #category : #generated }
JavaClassDeclarationNode >> extendsToken: aSmaCCToken [
	extendsToken := aSmaCCToken
]

{ #category : #generated }
JavaClassDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaClassDeclarationNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #generated }
JavaClassDeclarationNode >> implementsToken [
	^ implementsToken
]

{ #category : #generated }
JavaClassDeclarationNode >> implementsToken: aSmaCCToken [
	implementsToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
JavaClassDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	interfaces := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaClassDeclarationNode >> interfaces [
	^ interfaces
]

{ #category : #generated }
JavaClassDeclarationNode >> interfaces: anOrderedCollection [
	self setParents: self interfaces to: nil.
	interfaces := anOrderedCollection.
	self setParents: self interfaces to: self
]

{ #category : #generated }
JavaClassDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaClassDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaClassDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaClassDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaClassDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaClassDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaClassDeclarationNode >> nodeVariables [
	^ #(#typeParameters #superclass)
]

{ #category : #generated }
JavaClassDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaClassDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaClassDeclarationNode >> superclass [
	^ superclass
]

{ #category : #generated }
JavaClassDeclarationNode >> superclass: aJavaClassTypeNode [
	self superclass notNil
		ifTrue: [ self superclass parent: nil ].
	superclass := aJavaClassTypeNode.
	self superclass notNil
		ifTrue: [ self superclass parent: self ]
]

{ #category : #generated }
JavaClassDeclarationNode >> tokenVariables [
	^ #(#classToken #name #extendsToken #implementsToken)
]

{ #category : #generated }
JavaClassDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaClassDeclarationNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
