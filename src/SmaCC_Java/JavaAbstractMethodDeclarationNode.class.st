Class {
	#name : #JavaAbstractMethodDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'typeParameters',
		'type',
		'declarator',
		'throws',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAbstractMethodDeclaration: self
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers)
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> declarator [
	^ declarator
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> declarator: aJavaProgramNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aJavaProgramNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
JavaAbstractMethodDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> nodeVariables [
	^ #(#typeParameters #type #declarator #throws)
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> throws [
	^ throws
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> throws: aJavaThrowsNode [
	self throws notNil
		ifTrue: [ self throws parent: nil ].
	throws := aJavaThrowsNode.
	self throws notNil
		ifTrue: [ self throws parent: self ]
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> type [
	^ type
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> type: aJavaProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaAbstractMethodDeclarationNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
