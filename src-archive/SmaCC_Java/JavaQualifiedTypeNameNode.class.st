Class {
	#name : #JavaQualifiedTypeNameNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'nspace',
		'period',
		'name',
		'lt',
		'arguments',
		'commas',
		'gt'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaQualifiedTypeNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedTypeName: self
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> arguments [
	^ arguments
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> commas [
	^ commas
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> gt [
	^ gt
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> ignoredTokenVariables [
	^ #(#lt #gt)
]

{ #category : #'generated-initialize-release' }
JavaQualifiedTypeNameNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> lt [
	^ lt
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> name [
	^ name
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nodeVariables [
	^ #(#nspace)
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nspace [
	^ nspace
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nspace: aJavaProgramNode [
	self nspace notNil
		ifTrue: [ self nspace parent: nil ].
	nspace := aJavaProgramNode.
	self nspace notNil
		ifTrue: [ self nspace parent: self ]
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> period [
	^ period
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> tokenVariables [
	^ #(#period #name)
]
