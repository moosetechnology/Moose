Class {
	#name : #SwiftExpressionStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftExpressionStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitExpressionStatement: self
]

{ #category : #generated }
SwiftExpressionStatementNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftExpressionStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftExpressionStatementNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftExpressionStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftExpressionStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftExpressionStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
