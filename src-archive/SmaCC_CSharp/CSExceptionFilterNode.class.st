Class {
	#name : #CSExceptionFilterNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'whenToken',
		'leftParenToken',
		'expression',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSExceptionFilterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExceptionFilter: self
]

{ #category : #generated }
CSExceptionFilterNode >> expression [
	^ expression
]

{ #category : #generated }
CSExceptionFilterNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSExceptionFilterNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSExceptionFilterNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSExceptionFilterNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSExceptionFilterNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSExceptionFilterNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSExceptionFilterNode >> tokenVariables [
	^ #(#whenToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSExceptionFilterNode >> whenToken [
	^ whenToken
]

{ #category : #generated }
CSExceptionFilterNode >> whenToken: aSmaCCToken [
	whenToken := aSmaCCToken
]
