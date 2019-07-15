Class {
	#name : #JavaForStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'forToken',
		'leftParen',
		'initial',
		'firstSemicolon',
		'test',
		'secondSemicolon',
		'_update',
		'rightParen',
		'statement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaForStatementNode >> _update [
	^ _update
]

{ #category : #generated }
JavaForStatementNode >> _update: aJavaStatementExpressionListNode [
	self _update notNil
		ifTrue: [ self _update parent: nil ].
	_update := aJavaStatementExpressionListNode.
	self _update notNil
		ifTrue: [ self _update parent: self ]
]

{ #category : #generated }
JavaForStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForStatement: self
]

{ #category : #generated }
JavaForStatementNode >> firstSemicolon [
	^ firstSemicolon
]

{ #category : #generated }
JavaForStatementNode >> firstSemicolon: aSmaCCToken [
	firstSemicolon := aSmaCCToken
]

{ #category : #generated }
JavaForStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
JavaForStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
JavaForStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaForStatementNode >> initial [
	^ initial
]

{ #category : #generated }
JavaForStatementNode >> initial: aJavaProgramNode [
	self initial notNil
		ifTrue: [ self initial parent: nil ].
	initial := aJavaProgramNode.
	self initial notNil
		ifTrue: [ self initial parent: self ]
]

{ #category : #generated }
JavaForStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaForStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaForStatementNode >> nodeVariables [
	^ #(#initial #test #_update #statement)
]

{ #category : #generated }
JavaForStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaForStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaForStatementNode >> secondSemicolon [
	^ secondSemicolon
]

{ #category : #generated }
JavaForStatementNode >> secondSemicolon: aSmaCCToken [
	secondSemicolon := aSmaCCToken
]

{ #category : #generated }
JavaForStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JavaForStatementNode >> statement: aJavaStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JavaForStatementNode >> test [
	^ test
]

{ #category : #generated }
JavaForStatementNode >> test: aJavaExpressionNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aJavaExpressionNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
JavaForStatementNode >> tokenVariables [
	^ #(#forToken #firstSemicolon #secondSemicolon)
]
