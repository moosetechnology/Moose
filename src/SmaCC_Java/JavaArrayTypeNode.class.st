Class {
	#name : #JavaArrayTypeNode,
	#superclass : #JavaTypeNode,
	#instVars : [
		'baseType',
		'leftBrackets',
		'rightBrackets'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaArrayTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayType: self
]

{ #category : #generated }
JavaArrayTypeNode >> baseType [
	^ baseType
]

{ #category : #generated }
JavaArrayTypeNode >> baseType: aJavaProgramNode [
	self baseType notNil
		ifTrue: [ self baseType parent: nil ].
	baseType := aJavaProgramNode.
	self baseType notNil
		ifTrue: [ self baseType parent: self ]
]

{ #category : #generated }
JavaArrayTypeNode >> ignoredCompositeTokenVariables [
	^ #(#leftBrackets #rightBrackets)
]

{ #category : #'generated-initialize-release' }
JavaArrayTypeNode >> initialize [
	super initialize.
	leftBrackets := OrderedCollection new: 2.
	rightBrackets := OrderedCollection new: 2.
]

{ #category : #generated }
JavaArrayTypeNode >> leftBrackets [
	^ leftBrackets
]

{ #category : #generated }
JavaArrayTypeNode >> leftBrackets: anOrderedCollection [
	leftBrackets := anOrderedCollection
]

{ #category : #generated }
JavaArrayTypeNode >> nodeVariables [
	^ #(#baseType)
]

{ #category : #generated }
JavaArrayTypeNode >> rightBrackets [
	^ rightBrackets
]

{ #category : #generated }
JavaArrayTypeNode >> rightBrackets: anOrderedCollection [
	rightBrackets := anOrderedCollection
]
