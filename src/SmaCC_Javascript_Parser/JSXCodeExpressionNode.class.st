Class {
	#name : #JSXCodeExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'leftBrace',
		'expression',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXCodeExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXCodeExpression: self
]

{ #category : #generated }
JSXCodeExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSXCodeExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSXCodeExpressionNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #generated }
JSXCodeExpressionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSXCodeExpressionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSXCodeExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSXCodeExpressionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSXCodeExpressionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
