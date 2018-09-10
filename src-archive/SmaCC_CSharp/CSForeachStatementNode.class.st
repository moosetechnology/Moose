Class {
	#name : #CSForeachStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'foreachToken',
		'leftParenToken',
		'type',
		'name',
		'inToken',
		'expression',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSForeachStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForeachStatement: self
]

{ #category : #generated }
CSForeachStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSForeachStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSForeachStatementNode >> foreachToken [
	^ foreachToken
]

{ #category : #generated }
CSForeachStatementNode >> foreachToken: aSmaCCToken [
	foreachToken := aSmaCCToken
]

{ #category : #generated }
CSForeachStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
CSForeachStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
CSForeachStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSForeachStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSForeachStatementNode >> name [
	^ name
]

{ #category : #generated }
CSForeachStatementNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSForeachStatementNode >> nodeVariables [
	^ #(#type #expression #statement)
]

{ #category : #generated }
CSForeachStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSForeachStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSForeachStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSForeachStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSForeachStatementNode >> tokenVariables [
	^ #(#foreachToken #leftParenToken #name #inToken #rightParenToken)
]

{ #category : #generated }
CSForeachStatementNode >> type [
	^ type
]

{ #category : #generated }
CSForeachStatementNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
