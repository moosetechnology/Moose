Class {
	#name : #JavaDimensionExpressionNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'leftBracket',
		'expression',
		'rightBracket'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaDimensionExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDimensionExpression: self
]

{ #category : #generated }
JavaDimensionExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaDimensionExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaDimensionExpressionNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #generated }
JavaDimensionExpressionNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JavaDimensionExpressionNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JavaDimensionExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaDimensionExpressionNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JavaDimensionExpressionNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
