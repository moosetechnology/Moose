Class {
	#name : #JSBlockStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSBlockStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBlockStatement: self
]

{ #category : #generated }
JSBlockStatementNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSBlockStatementNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSBlockStatementNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSBlockStatementNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSBlockStatementNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSBlockStatementNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSBlockStatementNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSBlockStatementNode >> statements [
	^ statements
]

{ #category : #generated }
JSBlockStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
