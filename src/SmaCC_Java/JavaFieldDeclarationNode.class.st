Class {
	#name : #JavaFieldDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'type',
		'variableDeclarations',
		'commas',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaFieldDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFieldDeclaration: self
]

{ #category : #generated }
JavaFieldDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaFieldDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaFieldDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #variableDeclarations)
]

{ #category : #generated }
JavaFieldDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaFieldDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
JavaFieldDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	variableDeclarations := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaFieldDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaFieldDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaFieldDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
JavaFieldDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaFieldDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaFieldDeclarationNode >> type [
	^ type
]

{ #category : #generated }
JavaFieldDeclarationNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaFieldDeclarationNode >> variableDeclarations [
	^ variableDeclarations
]

{ #category : #generated }
JavaFieldDeclarationNode >> variableDeclarations: anOrderedCollection [
	self setParents: self variableDeclarations to: nil.
	variableDeclarations := anOrderedCollection.
	self setParents: self variableDeclarations to: self
]
