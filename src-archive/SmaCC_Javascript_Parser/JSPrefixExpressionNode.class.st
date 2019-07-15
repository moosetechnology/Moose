Class {
	#name : #JSPrefixExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'operator',
		'expression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSPrefixExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPrefixExpression: self
]

{ #category : #generated }
JSPrefixExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSPrefixExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSPrefixExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSPrefixExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
JSPrefixExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
JSPrefixExpressionNode >> tokenVariables [
	^ #(#operator)
]
