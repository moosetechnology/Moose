Class {
	#name : #CSThrowStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'throwToken',
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSThrowStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThrowStatement: self
]

{ #category : #generated }
CSThrowStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSThrowStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSThrowStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSThrowStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSThrowStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSThrowStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSThrowStatementNode >> throwToken [
	^ throwToken
]

{ #category : #generated }
CSThrowStatementNode >> throwToken: aSmaCCToken [
	throwToken := aSmaCCToken
]

{ #category : #generated }
CSThrowStatementNode >> tokenVariables [
	^ #(#throwToken)
]
