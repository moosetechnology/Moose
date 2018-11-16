Class {
	#name : #CSInterpolatedStringExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'stringParts',
		'interpolations'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterpolatedStringExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterpolatedStringExpression: self
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> compositeNodeVariables [
	^ #(#interpolations)
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> compositeTokenVariables [
	^ #(#stringParts)
]

{ #category : #'generated-initialize-release' }
CSInterpolatedStringExpressionNode >> initialize [
	super initialize.
	stringParts := OrderedCollection new: 2.
	interpolations := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> interpolations [
	^ interpolations
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> interpolations: anOrderedCollection [
	self setParents: self interpolations to: nil.
	interpolations := anOrderedCollection.
	self setParents: self interpolations to: self
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> stringParts [
	^ stringParts
]

{ #category : #generated }
CSInterpolatedStringExpressionNode >> stringParts: anOrderedCollection [
	stringParts := anOrderedCollection
]
