Class {
	#name : #SwiftControlTransferStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'semicolonToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftControlTransferStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitControlTransferStatement: self
]

{ #category : #generated }
SwiftControlTransferStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftControlTransferStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftControlTransferStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
