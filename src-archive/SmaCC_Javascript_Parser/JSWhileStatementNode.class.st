Class {
	#name : #JSWhileStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'whileToken',
		'left',
		'expression',
		'right',
		'statement'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWhileStatement: self
]

{ #category : #generated }
JSWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSWhileStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSWhileStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSWhileStatementNode >> left [
	^ left
]

{ #category : #generated }
JSWhileStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSWhileStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
JSWhileStatementNode >> right [
	^ right
]

{ #category : #generated }
JSWhileStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSWhileStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSWhileStatementNode >> tokenVariables [
	^ #(#whileToken)
]

{ #category : #generated }
JSWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
JSWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
