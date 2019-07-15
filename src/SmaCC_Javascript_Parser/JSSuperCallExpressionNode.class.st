Class {
	#name : #JSSuperCallExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'superToken',
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
JSSuperCallExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSuperCallExpression: self
]

{ #category : #generated }
JSSuperCallExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSSuperCallExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JSSuperCallExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JSSuperCallExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSSuperCallExpressionNode >> compositeNodeVariables [
	^ #(#arguments #varArguments)
]

{ #category : #generated }
JSSuperCallExpressionNode >> compositeTokenVariables [
	^ #(#ellipsises)
]

{ #category : #generated }
JSSuperCallExpressionNode >> ellipsises [
	^ ellipsises
]

{ #category : #generated }
JSSuperCallExpressionNode >> ellipsises: anOrderedCollection [
	ellipsises := anOrderedCollection
]

{ #category : #generated }
JSSuperCallExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSSuperCallExpressionNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #'generated-initialize-release' }
JSSuperCallExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	ellipsises := OrderedCollection new: 2.
	varArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSSuperCallExpressionNode >> left [
	^ left
]

{ #category : #generated }
JSSuperCallExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSSuperCallExpressionNode >> right [
	^ right
]

{ #category : #generated }
JSSuperCallExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSSuperCallExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
JSSuperCallExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JSSuperCallExpressionNode >> tokenVariables [
	^ #(#superToken)
]

{ #category : #generated }
JSSuperCallExpressionNode >> varArguments [
	^ varArguments
]

{ #category : #generated }
JSSuperCallExpressionNode >> varArguments: anOrderedCollection [
	self setParents: self varArguments to: nil.
	varArguments := anOrderedCollection.
	self setParents: self varArguments to: self
]
