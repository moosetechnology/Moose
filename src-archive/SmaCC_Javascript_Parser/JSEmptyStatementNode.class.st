Class {
	#name : #JSEmptyStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSEmptyStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyStatement: self
]

{ #category : #generated }
JSEmptyStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSEmptyStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSEmptyStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
