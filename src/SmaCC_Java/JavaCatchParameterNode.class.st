Class {
	#name : #JavaCatchParameterNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'modifiers',
		'types',
		'bars',
		'variable'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaCatchParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCatchParameter: self
]

{ #category : #generated }
JavaCatchParameterNode >> bars [
	^ bars
]

{ #category : #generated }
JavaCatchParameterNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
JavaCatchParameterNode >> compositeNodeVariables [
	^ #(#modifiers #types)
]

{ #category : #generated }
JavaCatchParameterNode >> compositeTokenVariables [
	^ #(#bars)
]

{ #category : #'generated-initialize-release' }
JavaCatchParameterNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	types := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
]

{ #category : #generated }
JavaCatchParameterNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaCatchParameterNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaCatchParameterNode >> nodeVariables [
	^ #(#variable)
]

{ #category : #generated }
JavaCatchParameterNode >> types [
	^ types
]

{ #category : #generated }
JavaCatchParameterNode >> types: anOrderedCollection [
	self setParents: self types to: nil.
	types := anOrderedCollection.
	self setParents: self types to: self
]

{ #category : #generated }
JavaCatchParameterNode >> variable [
	^ variable
]

{ #category : #generated }
JavaCatchParameterNode >> variable: aJavaProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
