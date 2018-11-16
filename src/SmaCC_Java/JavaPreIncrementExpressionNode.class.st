Class {
	#name : #JavaPreIncrementExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'plusPlus',
		'expression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPreIncrementExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPreIncrementExpression: self
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> plusPlus [
	^ plusPlus
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> plusPlus: aSmaCCToken [
	plusPlus := aSmaCCToken
]

{ #category : #generated }
JavaPreIncrementExpressionNode >> tokenVariables [
	^ #(#plusPlus)
]
