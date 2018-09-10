Class {
	#name : #SmaCCRewriteTestExpressionNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'leftParens',
		'rightParens'
	],
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitExpression: self
]

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
SmaCCRewriteTestExpressionNode >> initialize [
	super initialize.
	leftParens := OrderedCollection new: 2.
	rightParens := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> leftParens [
	^ leftParens
]

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> leftParens: anOrderedCollection [
	leftParens := anOrderedCollection
]

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> rightParens [
	^ rightParens
]

{ #category : #generated }
SmaCCRewriteTestExpressionNode >> rightParens: anOrderedCollection [
	rightParens := anOrderedCollection
]
