Class {
	#name : #CSPostExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'operator'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPostExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostExpression: self
]

{ #category : #generated }
CSPostExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSPostExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSPostExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSPostExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
CSPostExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
CSPostExpressionNode >> tokenVariables [
	^ #(#operator)
]
