Class {
	#name : #SwiftSelfExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'selfToken',
		'periodToken',
		'identifierToken',
		'leftBracketToken',
		'expression',
		'rightBracketToken',
		'initToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSelfExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSelfExpression: self
]

{ #category : #generated }
SwiftSelfExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftSelfExpressionNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftSelfExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> initToken [
	^ initToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> initToken: aSmaCCToken [
	initToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftSelfExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> selfToken [
	^ selfToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> selfToken: aSmaCCToken [
	selfToken := aSmaCCToken
]

{ #category : #generated }
SwiftSelfExpressionNode >> tokenVariables [
	^ #(#selfToken #periodToken #identifierToken #leftBracketToken #rightBracketToken #initToken)
]
