Class {
	#name : #JSExpressionNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftParens',
		'rightParens'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpression: self
]

{ #category : #generated }
JSExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
JSExpressionNode >> initialize [
	super initialize.
	leftParens := OrderedCollection new: 2.
	rightParens := OrderedCollection new: 2.
]

{ #category : #generated }
JSExpressionNode >> leftParens [
	^ leftParens
]

{ #category : #generated }
JSExpressionNode >> leftParens: anOrderedCollection [
	leftParens := anOrderedCollection
]

{ #category : #generated }
JSExpressionNode >> rightParens [
	^ rightParens
]

{ #category : #generated }
JSExpressionNode >> rightParens: anOrderedCollection [
	rightParens := anOrderedCollection
]
