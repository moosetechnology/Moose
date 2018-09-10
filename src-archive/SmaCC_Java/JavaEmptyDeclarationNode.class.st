Class {
	#name : #JavaEmptyDeclarationNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaEmptyDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyDeclaration: self
]

{ #category : #generated }
JavaEmptyDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaEmptyDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaEmptyDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
