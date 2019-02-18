Class {
	#name : #JavaTypeNameNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'name',
		'lt',
		'arguments',
		'commas',
		'gt'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaTypeNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeName: self
]

{ #category : #generated }
JavaTypeNameNode >> arguments [
	^ arguments
]

{ #category : #generated }
JavaTypeNameNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JavaTypeNameNode >> commas [
	^ commas
]

{ #category : #generated }
JavaTypeNameNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaTypeNameNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
JavaTypeNameNode >> gt [
	^ gt
]

{ #category : #generated }
JavaTypeNameNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #generated }
JavaTypeNameNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaTypeNameNode >> ignoredTokenVariables [
	^ #(#lt #gt)
]

{ #category : #'generated-initialize-release' }
JavaTypeNameNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaTypeNameNode >> lt [
	^ lt
]

{ #category : #generated }
JavaTypeNameNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
JavaTypeNameNode >> name [
	^ name
]

{ #category : #generated }
JavaTypeNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaTypeNameNode >> tokenVariables [
	^ #(#name)
]
