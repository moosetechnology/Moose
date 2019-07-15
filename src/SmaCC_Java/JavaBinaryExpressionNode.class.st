Class {
	#name : #JavaBinaryExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'leftExpression',
		'op',
		'rightExpression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaBinaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryExpression: self
]

{ #category : #generated }
JavaBinaryExpressionNode >> leftExpression [
	^ leftExpression
]

{ #category : #generated }
JavaBinaryExpressionNode >> leftExpression: aJavaExpressionNode [
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aJavaExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]
]

{ #category : #generated }
JavaBinaryExpressionNode >> nodeVariables [
	^ #(#leftExpression #rightExpression)
]

{ #category : #generated }
JavaBinaryExpressionNode >> op [
	^ op
]

{ #category : #generated }
JavaBinaryExpressionNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
JavaBinaryExpressionNode >> rightExpression [
	^ rightExpression
]

{ #category : #generated }
JavaBinaryExpressionNode >> rightExpression: aJavaProgramNode [
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: nil ].
	rightExpression := aJavaProgramNode.
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: self ]
]

{ #category : #generated }
JavaBinaryExpressionNode >> tokenVariables [
	^ #(#op)
]
