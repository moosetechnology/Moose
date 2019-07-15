Class {
	#name : #JavaAssertStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'assertToken',
		'testExpression',
		'semicolon',
		'colon',
		'messageExpression'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAssertStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssertStatement: self
]

{ #category : #generated }
JavaAssertStatementNode >> assertToken [
	^ assertToken
]

{ #category : #generated }
JavaAssertStatementNode >> assertToken: aSmaCCToken [
	assertToken := aSmaCCToken
]

{ #category : #generated }
JavaAssertStatementNode >> colon [
	^ colon
]

{ #category : #generated }
JavaAssertStatementNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaAssertStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaAssertStatementNode >> messageExpression [
	^ messageExpression
]

{ #category : #generated }
JavaAssertStatementNode >> messageExpression: aJavaExpressionNode [
	self messageExpression notNil
		ifTrue: [ self messageExpression parent: nil ].
	messageExpression := aJavaExpressionNode.
	self messageExpression notNil
		ifTrue: [ self messageExpression parent: self ]
]

{ #category : #generated }
JavaAssertStatementNode >> nodeVariables [
	^ #(#testExpression #messageExpression)
]

{ #category : #generated }
JavaAssertStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaAssertStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaAssertStatementNode >> testExpression [
	^ testExpression
]

{ #category : #generated }
JavaAssertStatementNode >> testExpression: aJavaExpressionNode [
	self testExpression notNil
		ifTrue: [ self testExpression parent: nil ].
	testExpression := aJavaExpressionNode.
	self testExpression notNil
		ifTrue: [ self testExpression parent: self ]
]

{ #category : #generated }
JavaAssertStatementNode >> tokenVariables [
	^ #(#assertToken #colon)
]
