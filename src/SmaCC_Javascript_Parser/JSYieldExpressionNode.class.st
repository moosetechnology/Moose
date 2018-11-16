Class {
	#name : #JSYieldExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'yieldToken',
		'star',
		'expression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSYieldExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitYieldExpression: self
]

{ #category : #generated }
JSYieldExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSYieldExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSYieldExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSYieldExpressionNode >> star [
	^ star
]

{ #category : #generated }
JSYieldExpressionNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JSYieldExpressionNode >> tokenVariables [
	^ #(#yieldToken #star)
]

{ #category : #generated }
JSYieldExpressionNode >> yieldToken [
	^ yieldToken
]

{ #category : #generated }
JSYieldExpressionNode >> yieldToken: aSmaCCToken [
	yieldToken := aSmaCCToken
]
