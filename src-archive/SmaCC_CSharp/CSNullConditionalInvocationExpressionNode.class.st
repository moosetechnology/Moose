Class {
	#name : #CSNullConditionalInvocationExpressionNode,
	#superclass : #CSInvocationExpressionNode,
	#instVars : [
		'baseOperations'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullConditionalInvocationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullConditionalInvocationExpression: self
]

{ #category : #generated }
CSNullConditionalInvocationExpressionNode >> baseOperations [
	^ baseOperations
]

{ #category : #generated }
CSNullConditionalInvocationExpressionNode >> baseOperations: aCSExpressionNode [
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: nil ].
	baseOperations := aCSExpressionNode.
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: self ]
]

{ #category : #generated }
CSNullConditionalInvocationExpressionNode >> nodeVariables [
	^ #(#baseOperations #expression)
]
