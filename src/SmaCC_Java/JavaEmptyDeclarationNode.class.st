Class {
	#name : #JavaEmptyDeclarationNode,
	#superclass : #JavaDeclarationNode,
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
