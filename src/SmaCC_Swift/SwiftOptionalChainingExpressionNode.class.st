Class {
	#name : #SwiftOptionalChainingExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'expression',
		'questionMarkToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitOptionalChainingExpression: self
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> expression: anOrderedCollection [
	expression := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
SwiftOptionalChainingExpressionNode >> tokenVariables [
	^ #(#questionMarkToken)
]
