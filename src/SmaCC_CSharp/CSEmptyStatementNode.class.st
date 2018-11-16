Class {
	#name : #CSEmptyStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSEmptyStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyStatement: self
]

{ #category : #generated }
CSEmptyStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSEmptyStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSEmptyStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]
