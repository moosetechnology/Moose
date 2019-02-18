Class {
	#name : #JavaParameterNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'modifiers',
		'type',
		'variable'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParameter: self
]

{ #category : #generated }
JavaParameterNode >> compositeNodeVariables [
	^ #(#modifiers)
]

{ #category : #'generated-initialize-release' }
JavaParameterNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
JavaParameterNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaParameterNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaParameterNode >> nodeVariables [
	^ #(#type #variable)
]

{ #category : #generated }
JavaParameterNode >> type [
	^ type
]

{ #category : #generated }
JavaParameterNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaParameterNode >> variable [
	^ variable
]

{ #category : #generated }
JavaParameterNode >> variable: aJavaProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
