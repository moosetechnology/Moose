Class {
	#name : #DelphiMethodCallExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'receiver',
		'left',
		'arguments',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMethodCallExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodCallExpression: self
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiMethodCallExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> nodeVariables [
	^ #(#receiver)
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> receiver [
	^ receiver
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> receiver: aDelphiExpressionNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aDelphiExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiMethodCallExpressionNode >> tokenVariables [
	^ #(#left #right)
]
