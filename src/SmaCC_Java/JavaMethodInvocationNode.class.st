Class {
	#name : #JavaMethodInvocationNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'lt',
		'arguments',
		'commas',
		'gt',
		'name',
		'leftParen',
		'expressions',
		'rightParen',
		'receiver',
		'period',
		'superToken',
		'superPeriod'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaMethodInvocationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodInvocation: self
]

{ #category : #generated }
JavaMethodInvocationNode >> arguments [
	^ arguments
]

{ #category : #generated }
JavaMethodInvocationNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JavaMethodInvocationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaMethodInvocationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaMethodInvocationNode >> compositeNodeVariables [
	^ #(#arguments #expressions)
]

{ #category : #generated }
JavaMethodInvocationNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaMethodInvocationNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaMethodInvocationNode >> gt [
	^ gt
]

{ #category : #generated }
JavaMethodInvocationNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> ignoredCompositeTokenVariables [
	^ #(#commas #_leftParens #_rightParens)
]

{ #category : #generated }
JavaMethodInvocationNode >> ignoredTokenVariables [
	^ #(#lt #gt #leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaMethodInvocationNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
JavaMethodInvocationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaMethodInvocationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> lt [
	^ lt
]

{ #category : #generated }
JavaMethodInvocationNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> name [
	^ name
]

{ #category : #generated }
JavaMethodInvocationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> nodeVariables [
	^ #(#receiver)
]

{ #category : #generated }
JavaMethodInvocationNode >> period [
	^ period
]

{ #category : #generated }
JavaMethodInvocationNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> receiver [
	^ receiver
]

{ #category : #generated }
JavaMethodInvocationNode >> receiver: aJavaExpressionNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aJavaExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]

{ #category : #generated }
JavaMethodInvocationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaMethodInvocationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> superPeriod [
	^ superPeriod
]

{ #category : #generated }
JavaMethodInvocationNode >> superPeriod: aSmaCCToken [
	superPeriod := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> superToken [
	^ superToken
]

{ #category : #generated }
JavaMethodInvocationNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JavaMethodInvocationNode >> tokenVariables [
	^ #(#name #period #superToken #superPeriod)
]
