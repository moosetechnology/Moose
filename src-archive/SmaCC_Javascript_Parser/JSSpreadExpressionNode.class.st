Class {
	#name : #JSSpreadExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'ellipsis',
		'expression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSSpreadExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSpreadExpression: self
]

{ #category : #generated }
JSSpreadExpressionNode >> ellipsis [
	^ ellipsis
]

{ #category : #generated }
JSSpreadExpressionNode >> ellipsis: aSmaCCToken [
	ellipsis := aSmaCCToken
]

{ #category : #generated }
JSSpreadExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSSpreadExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSSpreadExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSSpreadExpressionNode >> tokenVariables [
	^ #(#ellipsis)
]
