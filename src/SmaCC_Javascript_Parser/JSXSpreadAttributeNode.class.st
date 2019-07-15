Class {
	#name : #JSXSpreadAttributeNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftBrace',
		'element',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXSpreadAttributeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXSpreadAttribute: self
]

{ #category : #generated }
JSXSpreadAttributeNode >> element [
	^ element
]

{ #category : #generated }
JSXSpreadAttributeNode >> element: aJSSpreadExpressionNode [
	self element notNil
		ifTrue: [ self element parent: nil ].
	element := aJSSpreadExpressionNode.
	self element notNil
		ifTrue: [ self element parent: self ]
]

{ #category : #generated }
JSXSpreadAttributeNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #generated }
JSXSpreadAttributeNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSXSpreadAttributeNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSXSpreadAttributeNode >> nodeVariables [
	^ #(#element)
]

{ #category : #generated }
JSXSpreadAttributeNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSXSpreadAttributeNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
