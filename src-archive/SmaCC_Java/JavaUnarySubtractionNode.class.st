Class {
	#name : #JavaUnarySubtractionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'minus',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnarySubtractionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnarySubtraction: self
]

{ #category : #generated }
JavaUnarySubtractionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaUnarySubtractionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaUnarySubtractionNode >> minus [
	^ minus
]

{ #category : #generated }
JavaUnarySubtractionNode >> minus: aSmaCCToken [
	minus := aSmaCCToken
]

{ #category : #generated }
JavaUnarySubtractionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaUnarySubtractionNode >> tokenVariables [
	^ #(#minus)
]
