Class {
	#name : #DelphiExpressionNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'leftParens',
		'rightParens'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpression: self
]

{ #category : #generated }
DelphiExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiExpressionNode >> initialize [
	super initialize.
	leftParens := OrderedCollection new: 2.
	rightParens := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiExpressionNode >> leftParens [
	^ leftParens
]

{ #category : #generated }
DelphiExpressionNode >> leftParens: anOrderedCollection [
	leftParens := anOrderedCollection
]

{ #category : #generated }
DelphiExpressionNode >> rightParens [
	^ rightParens
]

{ #category : #generated }
DelphiExpressionNode >> rightParens: anOrderedCollection [
	rightParens := anOrderedCollection
]
