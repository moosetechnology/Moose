Class {
	#name : #SwiftForcedValueExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'expression',
		'bangToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftForcedValueExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitForcedValueExpression: self
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> bangToken [
	^ bangToken
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> bangToken: aSmaCCToken [
	bangToken := aSmaCCToken
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> expression: anOrderedCollection [
	expression := anOrderedCollection
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftForcedValueExpressionNode >> tokenVariables [
	^ #(#bangToken)
]
