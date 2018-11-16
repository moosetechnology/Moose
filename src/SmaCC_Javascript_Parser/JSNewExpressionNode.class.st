Class {
	#name : #JSNewExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'newToken',
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
JSNewExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNewExpression: self
]

{ #category : #generated }
JSNewExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSNewExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JSNewExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JSNewExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSNewExpressionNode >> compositeNodeVariables [
	^ #(#arguments #varArguments)
]

{ #category : #generated }
JSNewExpressionNode >> compositeTokenVariables [
	^ #(#ellipsises)
]

{ #category : #generated }
JSNewExpressionNode >> ellipsises [
	^ ellipsises
]

{ #category : #generated }
JSNewExpressionNode >> ellipsises: anOrderedCollection [
	ellipsises := anOrderedCollection
]

{ #category : #generated }
JSNewExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSNewExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSNewExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSNewExpressionNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #'generated-initialize-release' }
JSNewExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	ellipsises := OrderedCollection new: 2.
	varArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSNewExpressionNode >> left [
	^ left
]

{ #category : #generated }
JSNewExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
JSNewExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSNewExpressionNode >> right [
	^ right
]

{ #category : #generated }
JSNewExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> tokenVariables [
	^ #(#newToken)
]

{ #category : #generated }
JSNewExpressionNode >> varArguments [
	^ varArguments
]

{ #category : #generated }
JSNewExpressionNode >> varArguments: anOrderedCollection [
	self setParents: self varArguments to: nil.
	varArguments := anOrderedCollection.
	self setParents: self varArguments to: self
]
