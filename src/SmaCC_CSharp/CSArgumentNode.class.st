Class {
	#name : #CSArgumentNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifier',
		'colonToken',
		'expression',
		'refToken',
		'outToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSArgumentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArgument: self
]

{ #category : #generated }
CSArgumentNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSArgumentNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSArgumentNode >> expression [
	^ expression
]

{ #category : #generated }
CSArgumentNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSArgumentNode >> identifier [
	^ identifier
]

{ #category : #generated }
CSArgumentNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
CSArgumentNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSArgumentNode >> outToken [
	^ outToken
]

{ #category : #generated }
CSArgumentNode >> outToken: aSmaCCToken [
	outToken := aSmaCCToken
]

{ #category : #generated }
CSArgumentNode >> refToken [
	^ refToken
]

{ #category : #generated }
CSArgumentNode >> refToken: aSmaCCToken [
	refToken := aSmaCCToken
]

{ #category : #generated }
CSArgumentNode >> tokenVariables [
	^ #(#identifier #colonToken #refToken #outToken)
]
