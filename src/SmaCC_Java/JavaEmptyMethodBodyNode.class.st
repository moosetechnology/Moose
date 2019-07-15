Class {
	#name : #JavaEmptyMethodBodyNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaEmptyMethodBodyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyMethodBody: self
]

{ #category : #generated }
JavaEmptyMethodBodyNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaEmptyMethodBodyNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaEmptyMethodBodyNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
