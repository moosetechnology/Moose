Class {
	#name : #SwiftLoopStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'semicolonToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftLoopStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitLoopStatement: self
]

{ #category : #generated }
SwiftLoopStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftLoopStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftLoopStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
