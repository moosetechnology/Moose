Class {
	#name : #SwiftInOutExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'andToken',
		'identifierToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftInOutExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInOutExpression: self
]

{ #category : #generated }
SwiftInOutExpressionNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftInOutExpressionNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftInOutExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftInOutExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
SwiftInOutExpressionNode >> tokenVariables [
	^ #(#andToken #identifierToken)
]
