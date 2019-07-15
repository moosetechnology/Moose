Class {
	#name : #CSExpressionStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSExpressionStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpressionStatement: self
]

{ #category : #generated }
CSExpressionStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSExpressionStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSExpressionStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSExpressionStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSExpressionStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSExpressionStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]
