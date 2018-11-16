Class {
	#name : #CSPointerElementAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'leftBracketToken',
		'indexExpression',
		'rightBracketToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPointerElementAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPointerElementAccess: self
]

{ #category : #generated }
CSPointerElementAccessNode >> expression [
	^ expression
]

{ #category : #generated }
CSPointerElementAccessNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSPointerElementAccessNode >> indexExpression [
	^ indexExpression
]

{ #category : #generated }
CSPointerElementAccessNode >> indexExpression: aCSExpressionNode [
	self indexExpression notNil
		ifTrue: [ self indexExpression parent: nil ].
	indexExpression := aCSExpressionNode.
	self indexExpression notNil
		ifTrue: [ self indexExpression parent: self ]
]

{ #category : #generated }
CSPointerElementAccessNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSPointerElementAccessNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSPointerElementAccessNode >> nodeVariables [
	^ #(#expression #indexExpression)
]

{ #category : #generated }
CSPointerElementAccessNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSPointerElementAccessNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSPointerElementAccessNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken)
]
