Class {
	#name : #JavaAnnotationNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'_at',
		'name',
		'leftParen',
		'values',
		'commas',
		'rightParen'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAnnotationNode >> _at [
	^ _at
]

{ #category : #generated }
JavaAnnotationNode >> _at: aSmaCCToken [
	_at := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnnotation: self
]

{ #category : #generated }
JavaAnnotationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaAnnotationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaAnnotationNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #generated }
JavaAnnotationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaAnnotationNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaAnnotationNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaAnnotationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaAnnotationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationNode >> name [
	^ name
]

{ #category : #generated }
JavaAnnotationNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaAnnotationNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JavaAnnotationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaAnnotationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationNode >> tokenVariables [
	^ #(#_at)
]

{ #category : #generated }
JavaAnnotationNode >> values [
	^ values
]

{ #category : #generated }
JavaAnnotationNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
