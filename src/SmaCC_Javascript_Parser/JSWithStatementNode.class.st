Class {
	#name : #JSWithStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'withToken',
		'left',
		'expression',
		'right',
		'statement'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSWithStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWithStatement: self
]

{ #category : #generated }
JSWithStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSWithStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSWithStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSWithStatementNode >> left [
	^ left
]

{ #category : #generated }
JSWithStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSWithStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
JSWithStatementNode >> right [
	^ right
]

{ #category : #generated }
JSWithStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSWithStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSWithStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSWithStatementNode >> tokenVariables [
	^ #(#withToken)
]

{ #category : #generated }
JSWithStatementNode >> withToken [
	^ withToken
]

{ #category : #generated }
JSWithStatementNode >> withToken: aSmaCCToken [
	withToken := aSmaCCToken
]
