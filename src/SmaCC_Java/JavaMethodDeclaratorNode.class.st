Class {
	#name : #JavaMethodDeclaratorNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'name',
		'leftParen',
		'parameters',
		'commas',
		'rightParen'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaMethodDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodDeclarator: self
]

{ #category : #generated }
JavaMethodDeclaratorNode >> commas [
	^ commas
]

{ #category : #generated }
JavaMethodDeclaratorNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaMethodDeclaratorNode >> compositeNodeVariables [
	^ #(#parameters)
]

{ #category : #generated }
JavaMethodDeclaratorNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaMethodDeclaratorNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaMethodDeclaratorNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaMethodDeclaratorNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaMethodDeclaratorNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaMethodDeclaratorNode >> name [
	^ name
]

{ #category : #generated }
JavaMethodDeclaratorNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaMethodDeclaratorNode >> parameters [
	^ parameters
]

{ #category : #generated }
JavaMethodDeclaratorNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
JavaMethodDeclaratorNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaMethodDeclaratorNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaMethodDeclaratorNode >> tokenVariables [
	^ #(#name)
]
