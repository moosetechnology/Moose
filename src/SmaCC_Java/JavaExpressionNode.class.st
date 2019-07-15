Class {
	#name : #JavaExpressionNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'_leftParens',
		'_rightParens'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaExpressionNode >> _leftParens [
	^ _leftParens
]

{ #category : #generated }
JavaExpressionNode >> _leftParens: anOrderedCollection [
	_leftParens := anOrderedCollection
]

{ #category : #generated }
JavaExpressionNode >> _rightParens [
	^ _rightParens
]

{ #category : #generated }
JavaExpressionNode >> _rightParens: anOrderedCollection [
	_rightParens := anOrderedCollection
]

{ #category : #generated }
JavaExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpression: self
]

{ #category : #generated }
JavaExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
JavaExpressionNode >> initialize [
	super initialize.
	_leftParens := OrderedCollection new: 2.
	_rightParens := OrderedCollection new: 2.
]
