Class {
	#name : #CSPrefixExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'operator',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPrefixExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPrefixExpression: self
]

{ #category : #generated }
CSPrefixExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSPrefixExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSPrefixExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSPrefixExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
CSPrefixExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
CSPrefixExpressionNode >> tokenVariables [
	^ #(#operator)
]
