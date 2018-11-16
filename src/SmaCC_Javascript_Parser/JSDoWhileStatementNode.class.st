Class {
	#name : #JSDoWhileStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'doToken',
		'statement',
		'whileToken',
		'left',
		'expression',
		'right',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSDoWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDoWhileStatement: self
]

{ #category : #generated }
JSDoWhileStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
JSDoWhileStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
JSDoWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSDoWhileStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSDoWhileStatementNode >> ignoredTokenVariables [
	^ #(#left #right #semicolon)
]

{ #category : #generated }
JSDoWhileStatementNode >> left [
	^ left
]

{ #category : #generated }
JSDoWhileStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSDoWhileStatementNode >> nodeVariables [
	^ #(#statement #expression)
]

{ #category : #generated }
JSDoWhileStatementNode >> right [
	^ right
]

{ #category : #generated }
JSDoWhileStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSDoWhileStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSDoWhileStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSDoWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSDoWhileStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSDoWhileStatementNode >> tokenVariables [
	^ #(#doToken #whileToken)
]

{ #category : #generated }
JSDoWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
JSDoWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
