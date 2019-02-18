Class {
	#name : #JavaNewNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'newToken',
		'type',
		'leftParen',
		'expressions',
		'commas',
		'rightParen',
		'primary',
		'period',
		'lt',
		'arguments',
		'gt',
		'name',
		'typeArgLeft',
		'typeArgRight'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaNewNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNew: self
]

{ #category : #generated }
JavaNewNode >> arguments [
	^ arguments
]

{ #category : #generated }
JavaNewNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JavaNewNode >> commas [
	^ commas
]

{ #category : #generated }
JavaNewNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaNewNode >> compositeNodeVariables [
	^ #(#expressions #arguments)
]

{ #category : #generated }
JavaNewNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaNewNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaNewNode >> gt [
	^ gt
]

{ #category : #generated }
JavaNewNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> ignoredCompositeTokenVariables [
	^ #(#commas #_leftParens #_rightParens)
]

{ #category : #generated }
JavaNewNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #lt #gt)
]

{ #category : #'generated-initialize-release' }
JavaNewNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	arguments := OrderedCollection new: 2.
]

{ #category : #generated }
JavaNewNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaNewNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> lt [
	^ lt
]

{ #category : #generated }
JavaNewNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> name [
	^ name
]

{ #category : #generated }
JavaNewNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> newToken [
	^ newToken
]

{ #category : #generated }
JavaNewNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> nodeVariables [
	^ #(#type #primary)
]

{ #category : #generated }
JavaNewNode >> period [
	^ period
]

{ #category : #generated }
JavaNewNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> primary [
	^ primary
]

{ #category : #generated }
JavaNewNode >> primary: aJavaExpressionNode [
	self primary notNil
		ifTrue: [ self primary parent: nil ].
	primary := aJavaExpressionNode.
	self primary notNil
		ifTrue: [ self primary parent: self ]
]

{ #category : #generated }
JavaNewNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaNewNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> tokenVariables [
	^ #(#newToken #period #name #typeArgLeft #typeArgRight)
]

{ #category : #generated }
JavaNewNode >> type [
	^ type
]

{ #category : #generated }
JavaNewNode >> type: aJavaClassTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaClassTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
JavaNewNode >> typeArgLeft [
	^ typeArgLeft
]

{ #category : #generated }
JavaNewNode >> typeArgLeft: aSmaCCToken [
	typeArgLeft := aSmaCCToken
]

{ #category : #generated }
JavaNewNode >> typeArgRight [
	^ typeArgRight
]

{ #category : #generated }
JavaNewNode >> typeArgRight: aSmaCCToken [
	typeArgRight := aSmaCCToken
]
