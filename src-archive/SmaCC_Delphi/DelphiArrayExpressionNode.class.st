Class {
	#name : #DelphiArrayExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'expression',
		'left',
		'indexes',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiArrayExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayExpression: self
]

{ #category : #generated }
DelphiArrayExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiArrayExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiArrayExpressionNode >> compositeNodeVariables [
	^ #(#indexes)
]

{ #category : #generated }
DelphiArrayExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiArrayExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiArrayExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
DelphiArrayExpressionNode >> indexes [
	^ indexes
]

{ #category : #generated }
DelphiArrayExpressionNode >> indexes: anOrderedCollection [
	self setParents: self indexes to: nil.
	indexes := anOrderedCollection.
	self setParents: self indexes to: self
]

{ #category : #'generated-initialize-release' }
DelphiArrayExpressionNode >> initialize [
	super initialize.
	indexes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiArrayExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiArrayExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiArrayExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiArrayExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiArrayExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiArrayExpressionNode >> tokenVariables [
	^ #(#left #right)
]
