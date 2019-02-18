Class {
	#name : #JavaCastExpressionNode,
	#superclass : #JavaUnaryExpressionNode,
	#instVars : [
		'leftParen',
		'type',
		'rightParen',
		'ampToken',
		'interfaceType'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaCastExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCastExpression: self
]

{ #category : #generated }
JavaCastExpressionNode >> ampToken [
	^ ampToken
]

{ #category : #generated }
JavaCastExpressionNode >> ampToken: aSmaCCToken [
	ampToken := aSmaCCToken
]

{ #category : #generated }
JavaCastExpressionNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaCastExpressionNode >> interfaceType [
	^ interfaceType
]

{ #category : #generated }
JavaCastExpressionNode >> interfaceType: aJavaClassTypeNode [
	self interfaceType notNil
		ifTrue: [ self interfaceType parent: nil ].
	interfaceType := aJavaClassTypeNode.
	self interfaceType notNil
		ifTrue: [ self interfaceType parent: self ]
]

{ #category : #generated }
JavaCastExpressionNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaCastExpressionNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaCastExpressionNode >> nodeVariables [
	^ #(#type #interfaceType #expression)
]

{ #category : #generated }
JavaCastExpressionNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaCastExpressionNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaCastExpressionNode >> tokenVariables [
	^ #(#ampToken)
]

{ #category : #generated }
JavaCastExpressionNode >> type [
	^ type
]

{ #category : #generated }
JavaCastExpressionNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
