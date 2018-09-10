Class {
	#name : #DelphiSetExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'left',
		'values',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiSetExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetExpression: self
]

{ #category : #generated }
DelphiSetExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiSetExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiSetExpressionNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #generated }
DelphiSetExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiSetExpressionNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiSetExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiSetExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiSetExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiSetExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiSetExpressionNode >> tokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
DelphiSetExpressionNode >> values [
	^ values
]

{ #category : #generated }
DelphiSetExpressionNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
