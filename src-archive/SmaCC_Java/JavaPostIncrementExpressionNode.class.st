Class {
	#name : #JavaPostIncrementExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'expression',
		'plusPlus'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPostIncrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPostIncrementExpression: self
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> plusPlus [
	^ plusPlus
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> plusPlus: aSmaCCToken [
	plusPlus := aSmaCCToken
]

{ #category : #generated }
JavaPostIncrementExpressionNode >> tokenVariables [
	^ #(#plusPlus)
]
