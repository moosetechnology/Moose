Class {
	#name : #JavaTypeParametersNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'lt',
		'parameters',
		'commas',
		'gt'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaTypeParametersNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeParameters: self
]

{ #category : #generated }
JavaTypeParametersNode >> commas [
	^ commas
]

{ #category : #generated }
JavaTypeParametersNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaTypeParametersNode >> compositeNodeVariables [
	^ #(#parameters)
]

{ #category : #generated }
JavaTypeParametersNode >> gt [
	^ gt
]

{ #category : #generated }
JavaTypeParametersNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #generated }
JavaTypeParametersNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaTypeParametersNode >> ignoredTokenVariables [
	^ #(#lt #gt)
]

{ #category : #'generated-initialize-release' }
JavaTypeParametersNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaTypeParametersNode >> lt [
	^ lt
]

{ #category : #generated }
JavaTypeParametersNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
JavaTypeParametersNode >> parameters [
	^ parameters
]

{ #category : #generated }
JavaTypeParametersNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]
