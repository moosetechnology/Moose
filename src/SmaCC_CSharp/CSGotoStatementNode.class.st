Class {
	#name : #CSGotoStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'gotoToken',
		'identifierToken',
		'semicolonToken',
		'caseToken',
		'expression',
		'defaultToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSGotoStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGotoStatement: self
]

{ #category : #generated }
CSGotoStatementNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
CSGotoStatementNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
CSGotoStatementNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
CSGotoStatementNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
CSGotoStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CSGotoStatementNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSGotoStatementNode >> gotoToken [
	^ gotoToken
]

{ #category : #generated }
CSGotoStatementNode >> gotoToken: aSmaCCToken [
	gotoToken := aSmaCCToken
]

{ #category : #generated }
CSGotoStatementNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSGotoStatementNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSGotoStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSGotoStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSGotoStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSGotoStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSGotoStatementNode >> tokenVariables [
	^ #(#gotoToken #identifierToken #caseToken #defaultToken)
]
