Class {
	#name : #CSSwitchStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'switchToken',
		'leftParenToken',
		'expression',
		'rightParenToken',
		'leftBraceToken',
		'sections',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSSwitchStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchStatement: self
]

{ #category : #generated }
CSSwitchStatementNode >> compositeNodeVariables [
	^ #(#sections)
]

{ #category : #generated }
CSSwitchStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSSwitchStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #'generated-initialize-release' }
CSSwitchStatementNode >> initialize [
	super initialize.
	sections := OrderedCollection new: 2.
]

{ #category : #generated }
CSSwitchStatementNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSSwitchStatementNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSSwitchStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSSwitchStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSSwitchStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSSwitchStatementNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSSwitchStatementNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSSwitchStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSSwitchStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSSwitchStatementNode >> sections [
	^ sections
]

{ #category : #generated }
CSSwitchStatementNode >> sections: anOrderedCollection [
	self setParents: self sections to: nil.
	sections := anOrderedCollection.
	self setParents: self sections to: self
]

{ #category : #generated }
CSSwitchStatementNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
CSSwitchStatementNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
CSSwitchStatementNode >> tokenVariables [
	^ #(#switchToken #leftParenToken #rightParenToken #leftBraceToken #rightBraceToken)
]
