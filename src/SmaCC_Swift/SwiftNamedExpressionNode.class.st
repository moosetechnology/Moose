Class {
	#name : #SwiftNamedExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'identifierToken',
		'colonToken',
		'expression'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftNamedExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitNamedExpression: self
]

{ #category : #generated }
SwiftNamedExpressionNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
SwiftNamedExpressionNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
SwiftNamedExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftNamedExpressionNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftNamedExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftNamedExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
SwiftNamedExpressionNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftNamedExpressionNode >> tokenVariables [
	^ #(#identifierToken #colonToken)
]
