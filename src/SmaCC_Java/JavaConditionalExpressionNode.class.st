Class {
	#name : #JavaConditionalExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'testExpression',
		'questionMark',
		'trueExpression',
		'colon',
		'falseExpression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaConditionalExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConditionalExpression: self
]

{ #category : #generated }
JavaConditionalExpressionNode >> colon [
	^ colon
]

{ #category : #generated }
JavaConditionalExpressionNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaConditionalExpressionNode >> falseExpression [
	^ falseExpression
]

{ #category : #generated }
JavaConditionalExpressionNode >> falseExpression: aJavaExpressionNode [
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: nil ].
	falseExpression := aJavaExpressionNode.
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: self ]
]

{ #category : #generated }
JavaConditionalExpressionNode >> nodeVariables [
	^ #(#testExpression #trueExpression #falseExpression)
]

{ #category : #generated }
JavaConditionalExpressionNode >> questionMark [
	^ questionMark
]

{ #category : #generated }
JavaConditionalExpressionNode >> questionMark: aSmaCCToken [
	questionMark := aSmaCCToken
]

{ #category : #generated }
JavaConditionalExpressionNode >> testExpression [
	^ testExpression
]

{ #category : #generated }
JavaConditionalExpressionNode >> testExpression: aJavaExpressionNode [
	self testExpression notNil
		ifTrue: [ self testExpression parent: nil ].
	testExpression := aJavaExpressionNode.
	self testExpression notNil
		ifTrue: [ self testExpression parent: self ]
]

{ #category : #generated }
JavaConditionalExpressionNode >> tokenVariables [
	^ #(#questionMark #colon)
]

{ #category : #generated }
JavaConditionalExpressionNode >> trueExpression [
	^ trueExpression
]

{ #category : #generated }
JavaConditionalExpressionNode >> trueExpression: aJavaExpressionNode [
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aJavaExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]
]
