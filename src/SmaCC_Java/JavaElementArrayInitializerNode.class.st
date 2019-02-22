Class {
	#name : #JavaElementArrayInitializerNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'leftBrace',
		'values',
		'commas',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaElementArrayInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElementArrayInitializer: self
]

{ #category : #generated }
JavaElementArrayInitializerNode >> commas [
	^ commas
]

{ #category : #generated }
JavaElementArrayInitializerNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaElementArrayInitializerNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #generated }
JavaElementArrayInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaElementArrayInitializerNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaElementArrayInitializerNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaElementArrayInitializerNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaElementArrayInitializerNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaElementArrayInitializerNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaElementArrayInitializerNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaElementArrayInitializerNode >> values [
	^ values
]

{ #category : #generated }
JavaElementArrayInitializerNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
