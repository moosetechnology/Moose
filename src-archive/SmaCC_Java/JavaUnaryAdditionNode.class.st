Class {
	#name : #JavaUnaryAdditionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'plus',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryAdditionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryAddition: self
]

{ #category : #generated }
JavaUnaryAdditionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaUnaryAdditionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaUnaryAdditionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaUnaryAdditionNode >> plus [
	^ plus
]

{ #category : #generated }
JavaUnaryAdditionNode >> plus: aSmaCCToken [
	plus := aSmaCCToken
]

{ #category : #generated }
JavaUnaryAdditionNode >> tokenVariables [
	^ #(#plus)
]
