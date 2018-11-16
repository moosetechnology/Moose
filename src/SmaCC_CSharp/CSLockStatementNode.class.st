Class {
	#name : #CSLockStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'lockToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSLockStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLockStatement: self
]

{ #category : #generated }
CSLockStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSLockStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSLockStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSLockStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSLockStatementNode >> lockToken [
	^ lockToken
]

{ #category : #generated }
CSLockStatementNode >> lockToken: aSmaCCToken [
	lockToken := aSmaCCToken
]

{ #category : #generated }
CSLockStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
CSLockStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSLockStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSLockStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSLockStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSLockStatementNode >> tokenVariables [
	^ #(#lockToken #leftParenToken #rightParenToken)
]
