Class {
	#name : #SwiftForStatementNode,
	#superclass : #SwiftLoopStatementNode,
	#instVars : [
		'forToken',
		'expressions',
		'commaTokens',
		'testExpression',
		'incrementExpression',
		'block',
		'leftParenToken',
		'rightParenToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftForStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitForStatement: self
]

{ #category : #generated }
SwiftForStatementNode >> block [
	^ block
]

{ #category : #generated }
SwiftForStatementNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftForStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftForStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForStatementNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
SwiftForStatementNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftForStatementNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftForStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
SwiftForStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
SwiftForStatementNode >> incrementExpression [
	^ incrementExpression
]

{ #category : #generated }
SwiftForStatementNode >> incrementExpression: anObject [
	incrementExpression := anObject
]

{ #category : #'generated-initialize-release' }
SwiftForStatementNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftForStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
SwiftForStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftForStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftForStatementNode >> otherVariables [
	^ #(#expressions #testExpression #incrementExpression)
]

{ #category : #generated }
SwiftForStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
SwiftForStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftForStatementNode >> testExpression [
	^ testExpression
]

{ #category : #generated }
SwiftForStatementNode >> testExpression: anObject [
	testExpression := anObject
]

{ #category : #generated }
SwiftForStatementNode >> tokenVariables [
	^ #(#forToken #leftParenToken #rightParenToken #semicolonToken)
]
