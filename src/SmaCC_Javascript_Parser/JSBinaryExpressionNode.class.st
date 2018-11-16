Class {
	#name : #JSBinaryExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'leftExpression',
		'operator',
		'rightExpression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSBinaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryExpression: self
]

{ #category : #generated }
JSBinaryExpressionNode >> leftExpression [
	^ leftExpression
]

{ #category : #generated }
JSBinaryExpressionNode >> leftExpression: aJSExpressionNode [
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aJSExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]
]

{ #category : #generated }
JSBinaryExpressionNode >> nodeVariables [
	^ #(#leftExpression #rightExpression)
]

{ #category : #generated }
JSBinaryExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
JSBinaryExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
JSBinaryExpressionNode >> rightExpression [
	^ rightExpression
]

{ #category : #generated }
JSBinaryExpressionNode >> rightExpression: aJSExpressionNode [
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: nil ].
	rightExpression := aJSExpressionNode.
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: self ]
]

{ #category : #generated }
JSBinaryExpressionNode >> tokenVariables [
	^ #(#operator)
]
