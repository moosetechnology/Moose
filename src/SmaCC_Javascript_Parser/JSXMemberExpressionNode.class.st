Class {
	#name : #JSXMemberExpressionNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'identifiers',
		'periodTokens'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXMemberExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXMemberExpression: self
]

{ #category : #generated }
JSXMemberExpressionNode >> compositeTokenVariables [
	^ #(#identifiers #periodTokens)
]

{ #category : #generated }
JSXMemberExpressionNode >> identifiers [
	^ identifiers
]

{ #category : #generated }
JSXMemberExpressionNode >> identifiers: anOrderedCollection [
	identifiers := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
JSXMemberExpressionNode >> initialize [
	super initialize.
	identifiers := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
JSXMemberExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
JSXMemberExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]
