Class {
	#name : #CSWhileStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'whileToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWhileStatement: self
]

{ #category : #generated }
CSWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSWhileStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSWhileStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSWhileStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSWhileStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
CSWhileStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSWhileStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSWhileStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSWhileStatementNode >> tokenVariables [
	^ #(#whileToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
CSWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
