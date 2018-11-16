Class {
	#name : #JavaUnaryBitInvertNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'tilde',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaUnaryBitInvertNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryBitInvert: self
]

{ #category : #generated }
JavaUnaryBitInvertNode >> expression [
	^ expression
]

{ #category : #generated }
JavaUnaryBitInvertNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaUnaryBitInvertNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tilde [
	^ tilde
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tilde: aSmaCCToken [
	tilde := aSmaCCToken
]

{ #category : #generated }
JavaUnaryBitInvertNode >> tokenVariables [
	^ #(#tilde)
]
