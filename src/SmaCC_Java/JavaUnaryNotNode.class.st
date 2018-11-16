Class {
	#name : #JavaUnaryNotNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'bang',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryNotNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryNot: self
]

{ #category : #generated }
JavaUnaryNotNode >> bang [
	^ bang
]

{ #category : #generated }
JavaUnaryNotNode >> bang: aSmaCCToken [
	bang := aSmaCCToken
]

{ #category : #generated }
JavaUnaryNotNode >> expression [
	^ expression
]

{ #category : #generated }
JavaUnaryNotNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaUnaryNotNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaUnaryNotNode >> tokenVariables [
	^ #(#bang)
]
