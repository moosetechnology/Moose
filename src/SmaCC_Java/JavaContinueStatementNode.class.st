Class {
	#name : #JavaContinueStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'continueToken',
		'identifier',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaContinueStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitContinueStatement: self
]

{ #category : #generated }
JavaContinueStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
JavaContinueStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
JavaContinueStatementNode >> identifier [
	^ identifier
]

{ #category : #generated }
JavaContinueStatementNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
JavaContinueStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaContinueStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaContinueStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaContinueStatementNode >> tokenVariables [
	^ #(#continueToken #identifier)
]
