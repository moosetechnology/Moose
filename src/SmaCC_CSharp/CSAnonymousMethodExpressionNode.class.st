Class {
	#name : #CSAnonymousMethodExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'delegateToken',
		'signature',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAnonymousMethodExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousMethodExpression: self
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> block [
	^ block
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> delegateToken [
	^ delegateToken
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> delegateToken: aSmaCCToken [
	delegateToken := aSmaCCToken
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> nodeVariables [
	^ #(#signature #block)
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> signature [
	^ signature
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> signature: aCSExplicitAnonymousFunctionSignatureNode [
	self signature notNil
		ifTrue: [ self signature parent: nil ].
	signature := aCSExplicitAnonymousFunctionSignatureNode.
	self signature notNil
		ifTrue: [ self signature parent: self ]
]

{ #category : #generated }
CSAnonymousMethodExpressionNode >> tokenVariables [
	^ #(#delegateToken)
]
