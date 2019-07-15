Class {
	#name : #JSBreakStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'breakToken',
		'label',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSBreakStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBreakStatement: self
]

{ #category : #generated }
JSBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
JSBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
JSBreakStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSBreakStatementNode >> label [
	^ label
]

{ #category : #generated }
JSBreakStatementNode >> label: aJSNameExpressionNode [
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aJSNameExpressionNode.
	self label notNil
		ifTrue: [ self label parent: self ]
]

{ #category : #generated }
JSBreakStatementNode >> nodeVariables [
	^ #(#label)
]

{ #category : #generated }
JSBreakStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSBreakStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSBreakStatementNode >> tokenVariables [
	^ #(#breakToken)
]
