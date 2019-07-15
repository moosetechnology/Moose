Class {
	#name : #JavaArrayAccessNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'array',
		'leftBracket',
		'expression',
		'rightBracket'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaArrayAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayAccess: self
]

{ #category : #generated }
JavaArrayAccessNode >> array [
	^ array
]

{ #category : #generated }
JavaArrayAccessNode >> array: aJavaExpressionNode [
	self array notNil
		ifTrue: [ self array parent: nil ].
	array := aJavaExpressionNode.
	self array notNil
		ifTrue: [ self array parent: self ]
]

{ #category : #generated }
JavaArrayAccessNode >> expression [
	^ expression
]

{ #category : #generated }
JavaArrayAccessNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaArrayAccessNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #generated }
JavaArrayAccessNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JavaArrayAccessNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JavaArrayAccessNode >> nodeVariables [
	^ #(#array #expression)
]

{ #category : #generated }
JavaArrayAccessNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JavaArrayAccessNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
