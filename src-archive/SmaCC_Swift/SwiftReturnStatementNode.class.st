Class {
	#name : #SwiftReturnStatementNode,
	#superclass : #SwiftControlTransferStatementNode,
	#instVars : [
		'returnToken',
		'expression'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftReturnStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitReturnStatement: self
]

{ #category : #generated }
SwiftReturnStatementNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftReturnStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftReturnStatementNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftReturnStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
SwiftReturnStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
SwiftReturnStatementNode >> tokenVariables [
	^ #(#returnToken #semicolonToken)
]
