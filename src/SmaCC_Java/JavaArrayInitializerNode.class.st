Class {
	#name : #JavaArrayInitializerNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'leftBrace',
		'initializers',
		'commas',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaArrayInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayInitializer: self
]

{ #category : #generated }
JavaArrayInitializerNode >> commas [
	^ commas
]

{ #category : #generated }
JavaArrayInitializerNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaArrayInitializerNode >> compositeNodeVariables [
	^ #(#initializers)
]

{ #category : #generated }
JavaArrayInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaArrayInitializerNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaArrayInitializerNode >> initialize [
	super initialize.
	initializers := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaArrayInitializerNode >> initializers [
	^ initializers
]

{ #category : #generated }
JavaArrayInitializerNode >> initializers: anOrderedCollection [
	self setParents: self initializers to: nil.
	initializers := anOrderedCollection.
	self setParents: self initializers to: self
]

{ #category : #generated }
JavaArrayInitializerNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaArrayInitializerNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaArrayInitializerNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaArrayInitializerNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
