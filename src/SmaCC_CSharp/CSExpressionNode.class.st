Class {
	#name : #CSExpressionNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_leftParens',
		'_rightParens'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSExpressionNode >> _leftParens [
	^ _leftParens
]

{ #category : #generated }
CSExpressionNode >> _leftParens: anOrderedCollection [
	_leftParens := anOrderedCollection
]

{ #category : #generated }
CSExpressionNode >> _rightParens [
	^ _rightParens
]

{ #category : #generated }
CSExpressionNode >> _rightParens: anOrderedCollection [
	_rightParens := anOrderedCollection
]

{ #category : #generated }
CSExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpression: self
]

{ #category : #generated }
CSExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSExpressionNode >> initialize [
	super initialize.
	_leftParens := OrderedCollection new: 2.
	_rightParens := OrderedCollection new: 2.
]
