Class {
	#name : #CSDefaultValueExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'defaultToken',
		'leftParenToken',
		'type',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDefaultValueExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDefaultValueExpression: self
]

{ #category : #generated }
CSDefaultValueExpressionNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSDefaultValueExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSDefaultValueExpressionNode >> tokenVariables [
	^ #(#defaultToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSDefaultValueExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSDefaultValueExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
