Class {
	#name : #JavaThrowsNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'throwsToken',
		'classTypes',
		'commas'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaThrowsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThrows: self
]

{ #category : #generated }
JavaThrowsNode >> classTypes [
	^ classTypes
]

{ #category : #generated }
JavaThrowsNode >> classTypes: anOrderedCollection [
	self setParents: self classTypes to: nil.
	classTypes := anOrderedCollection.
	self setParents: self classTypes to: self
]

{ #category : #generated }
JavaThrowsNode >> commas [
	^ commas
]

{ #category : #generated }
JavaThrowsNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaThrowsNode >> compositeNodeVariables [
	^ #(#classTypes)
]

{ #category : #generated }
JavaThrowsNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
JavaThrowsNode >> initialize [
	super initialize.
	classTypes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaThrowsNode >> throwsToken [
	^ throwsToken
]

{ #category : #generated }
JavaThrowsNode >> throwsToken: aSmaCCToken [
	throwsToken := aSmaCCToken
]

{ #category : #generated }
JavaThrowsNode >> tokenVariables [
	^ #(#throwsToken)
]
