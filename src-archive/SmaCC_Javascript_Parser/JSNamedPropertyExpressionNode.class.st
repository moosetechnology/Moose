Class {
	#name : #JSNamedPropertyExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'periodToken',
		'name'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNamedPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedPropertyExpression: self
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> name [
	^ name
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
JSNamedPropertyExpressionNode >> tokenVariables [
	^ #(#periodToken #name)
]
