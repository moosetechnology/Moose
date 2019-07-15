Class {
	#name : #JSCommaExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expressions',
		'comma'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSCommaExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCommaExpression: self
]

{ #category : #generated }
JSCommaExpressionNode >> comma [
	^ comma
]

{ #category : #generated }
JSCommaExpressionNode >> comma: aSmaCCToken [
	comma := aSmaCCToken
]

{ #category : #generated }
JSCommaExpressionNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JSCommaExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
JSCommaExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JSCommaExpressionNode >> ignoredTokenVariables [
	^ #(#comma)
]

{ #category : #'generated-initialize-release' }
JSCommaExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
]
