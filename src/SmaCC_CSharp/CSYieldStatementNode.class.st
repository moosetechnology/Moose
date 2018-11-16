Class {
	#name : #CSYieldStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'yieldToken',
		'returnToken',
		'expression',
		'semicolonToken',
		'breakToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSYieldStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitYieldStatement: self
]

{ #category : #generated }
CSYieldStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
CSYieldStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
CSYieldStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSYieldStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSYieldStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSYieldStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSYieldStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
CSYieldStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
CSYieldStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSYieldStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSYieldStatementNode >> tokenVariables [
	^ #(#yieldToken #returnToken #breakToken)
]

{ #category : #generated }
CSYieldStatementNode >> yieldToken [
	^ yieldToken
]

{ #category : #generated }
CSYieldStatementNode >> yieldToken: aSmaCCToken [
	yieldToken := aSmaCCToken
]
