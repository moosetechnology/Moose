Class {
	#name : #JSCallExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'left',
		'right',
		'arguments',
		'ellipsises',
		'varArguments',
		'commas'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSCallExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCallExpression: self
]

{ #category : #generated }
JSCallExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSCallExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JSCallExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JSCallExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSCallExpressionNode >> compositeNodeVariables [
	^ #(#arguments #varArguments)
]

{ #category : #generated }
JSCallExpressionNode >> compositeTokenVariables [
	^ #(#ellipsises)
]

{ #category : #generated }
JSCallExpressionNode >> ellipsises [
	^ ellipsises
]

{ #category : #generated }
JSCallExpressionNode >> ellipsises: anOrderedCollection [
	ellipsises := anOrderedCollection
]

{ #category : #generated }
JSCallExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSCallExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSCallExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSCallExpressionNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #'generated-initialize-release' }
JSCallExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	ellipsises := OrderedCollection new: 2.
	varArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSCallExpressionNode >> left [
	^ left
]

{ #category : #generated }
JSCallExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSCallExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSCallExpressionNode >> right [
	^ right
]

{ #category : #generated }
JSCallExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSCallExpressionNode >> varArguments [
	^ varArguments
]

{ #category : #generated }
JSCallExpressionNode >> varArguments: anOrderedCollection [
	self setParents: self varArguments to: nil.
	varArguments := anOrderedCollection.
	self setParents: self varArguments to: self
]
