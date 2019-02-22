Class {
	#name : #JavaTypeParameterNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'name',
		'extendsToken',
		'types',
		'amps'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaTypeParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeParameter: self
]

{ #category : #generated }
JavaTypeParameterNode >> amps [
	^ amps
]

{ #category : #generated }
JavaTypeParameterNode >> amps: anOrderedCollection [
	amps := anOrderedCollection
]

{ #category : #generated }
JavaTypeParameterNode >> compositeNodeVariables [
	^ #(#types)
]

{ #category : #generated }
JavaTypeParameterNode >> compositeTokenVariables [
	^ #(#amps)
]

{ #category : #generated }
JavaTypeParameterNode >> extendsToken [
	^ extendsToken
]

{ #category : #generated }
JavaTypeParameterNode >> extendsToken: aSmaCCToken [
	extendsToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
JavaTypeParameterNode >> initialize [
	super initialize.
	types := OrderedCollection new: 2.
	amps := OrderedCollection new: 2.
]

{ #category : #generated }
JavaTypeParameterNode >> name [
	^ name
]

{ #category : #generated }
JavaTypeParameterNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaTypeParameterNode >> tokenVariables [
	^ #(#name #extendsToken)
]

{ #category : #generated }
JavaTypeParameterNode >> types [
	^ types
]

{ #category : #generated }
JavaTypeParameterNode >> types: anOrderedCollection [
	self setParents: self types to: nil.
	types := anOrderedCollection.
	self setParents: self types to: self
]
