Class {
	#name : #SwiftBreakStatementNode,
	#superclass : #SwiftControlTransferStatementNode,
	#instVars : [
		'breakToken',
		'name'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftBreakStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBreakStatement: self
]

{ #category : #generated }
SwiftBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
SwiftBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
SwiftBreakStatementNode >> name [
	^ name
]

{ #category : #generated }
SwiftBreakStatementNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SwiftBreakStatementNode >> tokenVariables [
	^ #(#breakToken #name #semicolonToken)
]
