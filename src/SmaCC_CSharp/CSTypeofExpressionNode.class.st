Class {
	#name : #CSTypeofExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'typeofToken',
		'leftParenToken',
		'type',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeofExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeofExpression: self
]

{ #category : #generated }
CSTypeofExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSTypeofExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSTypeofExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSTypeofExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSTypeofExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSTypeofExpressionNode >> tokenVariables [
	^ #(#typeofToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSTypeofExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSTypeofExpressionNode >> type: aCSProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
CSTypeofExpressionNode >> typeofToken [
	^ typeofToken
]

{ #category : #generated }
CSTypeofExpressionNode >> typeofToken: aSmaCCToken [
	typeofToken := aSmaCCToken
]
