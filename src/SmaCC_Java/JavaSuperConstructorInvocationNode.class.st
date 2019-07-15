Class {
	#name : #JavaSuperConstructorInvocationNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'superToken',
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
JavaSuperConstructorInvocationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSuperConstructorInvocation: self
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> commas [
	^ commas
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #semicolon)
]

{ #category : #'generated-initialize-release' }
JavaSuperConstructorInvocationNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> nodeVariables [
	^ #(#primary)
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> period [
	^ period
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> primary [
	^ primary
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> primary: aJavaExpressionNode [
	self primary notNil
		ifTrue: [ self primary parent: nil ].
	primary := aJavaExpressionNode.
	self primary notNil
		ifTrue: [ self primary parent: self ]
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> superToken [
	^ superToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JavaSuperConstructorInvocationNode >> tokenVariables [
	^ #(#superToken #period)
]
