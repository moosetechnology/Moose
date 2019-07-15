Class {
	#name : #SwiftSuperclassSubscriptExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'superToken',
		'leftBracketToken',
		'expression',
		'rightBracketToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSuperclassSubscriptExpression: self
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassSubscriptExpressionNode >> tokenVariables [
	^ #(#superToken #leftBracketToken #rightBracketToken)
]
