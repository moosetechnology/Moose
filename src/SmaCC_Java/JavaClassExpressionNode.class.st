Class {
	#name : #JavaClassExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'type',
		'period',
		'classToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaClassExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassExpression: self
]

{ #category : #generated }
JavaClassExpressionNode >> classToken [
	^ classToken
]

{ #category : #generated }
JavaClassExpressionNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
JavaClassExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
JavaClassExpressionNode >> period [
	^ period
]

{ #category : #generated }
JavaClassExpressionNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaClassExpressionNode >> tokenVariables [
	^ #(#period #classToken)
]

{ #category : #generated }
JavaClassExpressionNode >> type [
	^ type
]

{ #category : #generated }
JavaClassExpressionNode >> type: aJavaProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
