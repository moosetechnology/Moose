Class {
	#name : #JavaMethodDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'modifiers',
		'typeParameters',
		'type',
		'declarator',
		'throws',
		'body'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaMethodDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodDeclaration: self
]

{ #category : #generated }
JavaMethodDeclarationNode >> body [
	^ body
]

{ #category : #generated }
JavaMethodDeclarationNode >> body: aJavaProgramNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aJavaProgramNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
JavaMethodDeclarationNode >> compositeNodeVariables [
	^ #(#modifiers)
]

{ #category : #generated }
JavaMethodDeclarationNode >> declarator [
	^ declarator
]

{ #category : #generated }
JavaMethodDeclarationNode >> declarator: aJavaProgramNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aJavaProgramNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #'generated-initialize-release' }
JavaMethodDeclarationNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
JavaMethodDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaMethodDeclarationNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaMethodDeclarationNode >> nodeVariables [
	^ #(#typeParameters #type #declarator #throws #body)
]

{ #category : #generated }
JavaMethodDeclarationNode >> throws [
	^ throws
]

{ #category : #generated }
JavaMethodDeclarationNode >> throws: aJavaThrowsNode [
	self throws notNil
		ifTrue: [ self throws parent: nil ].
	throws := aJavaThrowsNode.
	self throws notNil
		ifTrue: [ self throws parent: self ]
]

{ #category : #generated }
JavaMethodDeclarationNode >> type [
	^ type
]

{ #category : #generated }
JavaMethodDeclarationNode >> type: aJavaProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaMethodDeclarationNode >> typeParameters [
	^ typeParameters
]

{ #category : #generated }
JavaMethodDeclarationNode >> typeParameters: aJavaTypeParametersNode [
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: nil ].
	typeParameters := aJavaTypeParametersNode.
	self typeParameters notNil
		ifTrue: [ self typeParameters parent: self ]
]
