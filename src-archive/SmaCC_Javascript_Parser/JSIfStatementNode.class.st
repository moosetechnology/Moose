Class {
	#name : #JSIfStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'ifToken',
		'left',
		'expression',
		'right',
		'trueStatement',
		'elseToken',
		'elseStatement'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSIfStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIfStatement: self
]

{ #category : #generated }
JSIfStatementNode >> elseStatement [
	^ elseStatement
]

{ #category : #generated }
JSIfStatementNode >> elseStatement: aJSStatementNode [
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: nil ].
	elseStatement := aJSStatementNode.
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: self ]
]

{ #category : #generated }
JSIfStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
JSIfStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
JSIfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSIfStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSIfStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
JSIfStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
JSIfStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSIfStatementNode >> left [
	^ left
]

{ #category : #generated }
JSIfStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSIfStatementNode >> nodeVariables [
	^ #(#expression #trueStatement #elseStatement)
]

{ #category : #generated }
JSIfStatementNode >> right [
	^ right
]

{ #category : #generated }
JSIfStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSIfStatementNode >> tokenVariables [
	^ #(#ifToken #elseToken)
]

{ #category : #generated }
JSIfStatementNode >> trueStatement [
	^ trueStatement
]

{ #category : #generated }
JSIfStatementNode >> trueStatement: aJSStatementNode [
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: nil ].
	trueStatement := aJSStatementNode.
	self trueStatement notNil
		ifTrue: [ self trueStatement parent: self ]
]
