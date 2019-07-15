Class {
	#name : #JavaConstructorDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'typeParameters',
		'name',
		'leftParen',
		'parameters',
		'commas',
		'rightParen',
		'throws',
		'body'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaConstructorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorDeclaration: self
]

{ #category : #generated }
JavaConstructorDeclarationNode >> body [
	^ body
]

{ #category : #generated }
JavaConstructorDeclarationNode >> body: aJavaBlockNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aJavaBlockNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
JavaConstructorDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaConstructorDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaConstructorDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #parameters)
]

{ #category : #generated }
JavaConstructorDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaConstructorDeclarationNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaConstructorDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaConstructorDeclarationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaConstructorDeclarationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaConstructorDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaConstructorDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaConstructorDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaConstructorDeclarationNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaConstructorDeclarationNode >> nodeVariables [
	^ #(#typeParameters #name #throws #body)
]

{ #category : #generated }
JavaConstructorDeclarationNode >> parameters [
	^ parameters
]

{ #category : #generated }
JavaConstructorDeclarationNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
JavaConstructorDeclarationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaConstructorDeclarationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaConstructorDeclarationNode >> throws [
	^ throws
]

{ #category : #generated }
JavaConstructorDeclarationNode >> throws: aJavaThrowsNode [
	self throws notNil
		ifTrue: [ self throws parent: nil ].
	throws := aJavaThrowsNode.
	self throws notNil
		ifTrue: [ self throws parent: self ]
]

{ #category : #generated }
JavaConstructorDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaConstructorDeclarationNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
