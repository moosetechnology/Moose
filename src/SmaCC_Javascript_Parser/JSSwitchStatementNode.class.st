Class {
	#name : #JSSwitchStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'switchToken',
		'left',
		'expression',
		'right',
		'leftBrace',
		'clauses',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSSwitchStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchStatement: self
]

{ #category : #generated }
JSSwitchStatementNode >> clauses [
	^ clauses
]

{ #category : #generated }
JSSwitchStatementNode >> clauses: anOrderedCollection [
	self setParents: self clauses to: nil.
	clauses := anOrderedCollection.
	self setParents: self clauses to: self
]

{ #category : #generated }
JSSwitchStatementNode >> compositeNodeVariables [
	^ #(#clauses)
]

{ #category : #generated }
JSSwitchStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSSwitchStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSSwitchStatementNode >> ignoredTokenVariables [
	^ #(#left #right #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSSwitchStatementNode >> initialize [
	super initialize.
	clauses := OrderedCollection new: 2.
]

{ #category : #generated }
JSSwitchStatementNode >> left [
	^ left
]

{ #category : #generated }
JSSwitchStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSSwitchStatementNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSSwitchStatementNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSSwitchStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSSwitchStatementNode >> right [
	^ right
]

{ #category : #generated }
JSSwitchStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSSwitchStatementNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSSwitchStatementNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSSwitchStatementNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
JSSwitchStatementNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
JSSwitchStatementNode >> tokenVariables [
	^ #(#switchToken)
]
