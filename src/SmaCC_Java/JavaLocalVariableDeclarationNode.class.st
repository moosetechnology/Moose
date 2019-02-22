Class {
	#name : #JavaLocalVariableDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'type',
		'variableDeclarations',
		'commas'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLocalVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLocalVariableDeclaration: self
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers #variableDeclarations)
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
JavaLocalVariableDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	variableDeclarations := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> type [
	^ type
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> variableDeclarations [
	^ variableDeclarations
]

{ #category : #generated }
JavaLocalVariableDeclarationNode >> variableDeclarations: anOrderedCollection [
	self setParents: self variableDeclarations to: nil.
	variableDeclarations := anOrderedCollection.
	self setParents: self variableDeclarations to: self
]
