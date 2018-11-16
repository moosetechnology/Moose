Class {
	#name : #CSReturnStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'returnToken',
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSReturnStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitReturnStatement: self
]

{ #category : #generated }
CSReturnStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSReturnStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSReturnStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSReturnStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSReturnStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
CSReturnStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
CSReturnStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSReturnStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSReturnStatementNode >> tokenVariables [
	^ #(#returnToken)
]
