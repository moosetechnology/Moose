Class {
	#name : #CSMethodBodyNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'block',
		'equalGreaterThanToken',
		'expression',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSMethodBodyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodBody: self
]

{ #category : #generated }
CSMethodBodyNode >> block [
	^ block
]

{ #category : #generated }
CSMethodBodyNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSMethodBodyNode >> equalGreaterThanToken [
	^ equalGreaterThanToken
]

{ #category : #generated }
CSMethodBodyNode >> equalGreaterThanToken: aSmaCCToken [
	equalGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
CSMethodBodyNode >> expression [
	^ expression
]

{ #category : #generated }
CSMethodBodyNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSMethodBodyNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSMethodBodyNode >> nodeVariables [
	^ #(#block #expression)
]

{ #category : #generated }
CSMethodBodyNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSMethodBodyNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSMethodBodyNode >> tokenVariables [
	^ #(#equalGreaterThanToken)
]
