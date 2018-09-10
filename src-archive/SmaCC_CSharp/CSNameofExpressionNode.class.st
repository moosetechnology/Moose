Class {
	#name : #CSNameofExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'nameofToken',
		'leftParenToken',
		'name',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNameofExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNameofExpression: self
]

{ #category : #generated }
CSNameofExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSNameofExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSNameofExpressionNode >> name [
	^ name
]

{ #category : #generated }
CSNameofExpressionNode >> name: aCSExpressionNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aCSExpressionNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
CSNameofExpressionNode >> nameofToken [
	^ nameofToken
]

{ #category : #generated }
CSNameofExpressionNode >> nameofToken: aSmaCCToken [
	nameofToken := aSmaCCToken
]

{ #category : #generated }
CSNameofExpressionNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
CSNameofExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSNameofExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSNameofExpressionNode >> tokenVariables [
	^ #(#nameofToken #leftParenToken #rightParenToken)
]
