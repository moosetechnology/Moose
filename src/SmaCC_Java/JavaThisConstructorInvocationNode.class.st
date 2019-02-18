Class {
	#name : #JavaThisConstructorInvocationNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'thisToken',
		'leftParen',
		'expressions',
		'commas',
		'rightParen',
		'semicolon',
		'primary',
		'period'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaThisConstructorInvocationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThisConstructorInvocation: self
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #semicolon)
]

{ #category : #'generated-initialize-release' }
JavaThisConstructorInvocationNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> nodeVariables [
	^ #(#primary)
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> period [
	^ period
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> primary [
	^ primary
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> primary: aJavaExpressionNode [
	self primary notNil
		ifTrue: [ self primary parent: nil ].
	primary := aJavaExpressionNode.
	self primary notNil
		ifTrue: [ self primary parent: self ]
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
JavaThisConstructorInvocationNode >> tokenVariables [
	^ #(#thisToken #period)
]
