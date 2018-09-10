Class {
	#name : #SwiftContinueStatementNode,
	#superclass : #SwiftControlTransferStatementNode,
	#instVars : [
		'continueToken',
		'name'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftContinueStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitContinueStatement: self
]

{ #category : #generated }
SwiftContinueStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
SwiftContinueStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
SwiftContinueStatementNode >> name [
	^ name
]

{ #category : #generated }
SwiftContinueStatementNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SwiftContinueStatementNode >> tokenVariables [
	^ #(#continueToken #name #semicolonToken)
]
