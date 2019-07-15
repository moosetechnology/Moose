Class {
	#name : #CSBlockStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'leftBraceToken',
		'statements',
		'rightBraceToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSBlockStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBlockStatement: self
]

{ #category : #generated }
CSBlockStatementNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
CSBlockStatementNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
CSBlockStatementNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSBlockStatementNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSBlockStatementNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSBlockStatementNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSBlockStatementNode >> statements [
	^ statements
]

{ #category : #generated }
CSBlockStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
CSBlockStatementNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
