Class {
	#name : #JSComputedPropertyNameNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftBrace',
		'expression',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSComputedPropertyNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitComputedPropertyName: self
]

{ #category : #generated }
JSComputedPropertyNameNode >> expression [
	^ expression
]

{ #category : #generated }
JSComputedPropertyNameNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSComputedPropertyNameNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #generated }
JSComputedPropertyNameNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSComputedPropertyNameNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSComputedPropertyNameNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSComputedPropertyNameNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSComputedPropertyNameNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
