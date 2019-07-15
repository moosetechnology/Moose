Class {
	#name : #CSUsingStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'usingToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUsingStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUsingStatement: self
]

{ #category : #generated }
CSUsingStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSUsingStatementNode >> expression: aCSProgramNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSProgramNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSUsingStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSUsingStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSUsingStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
CSUsingStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSUsingStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSUsingStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSUsingStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSUsingStatementNode >> tokenVariables [
	^ #(#usingToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSUsingStatementNode >> usingToken [
	^ usingToken
]

{ #category : #generated }
CSUsingStatementNode >> usingToken: aSmaCCToken [
	usingToken := aSmaCCToken
]
