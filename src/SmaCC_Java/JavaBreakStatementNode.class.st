Class {
	#name : #JavaBreakStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'breakToken',
		'identifier',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaBreakStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBreakStatement: self
]

{ #category : #generated }
JavaBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
JavaBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
JavaBreakStatementNode >> identifier [
	^ identifier
]

{ #category : #generated }
JavaBreakStatementNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
JavaBreakStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaBreakStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaBreakStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaBreakStatementNode >> tokenVariables [
	^ #(#breakToken #identifier)
]
