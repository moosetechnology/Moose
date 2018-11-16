Class {
	#name : #CSBreakStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'breakToken',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSBreakStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBreakStatement: self
]

{ #category : #generated }
CSBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
CSBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
CSBreakStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSBreakStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSBreakStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSBreakStatementNode >> tokenVariables [
	^ #(#breakToken)
]
