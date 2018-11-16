Class {
	#name : #SwiftPrefixOperatorDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'operatorTokens',
		'prefixToken',
		'leftBraceToken',
		'rightBraceToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitPrefixOperatorDeclaration: self
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> compositeTokenVariables [
	^ #(#operatorTokens)
]

{ #category : #'generated-initialize-release' }
SwiftPrefixOperatorDeclarationNode >> initialize [
	super initialize.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> prefixToken [
	^ prefixToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> prefixToken: aSmaCCToken [
	prefixToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixOperatorDeclarationNode >> tokenVariables [
	^ #(#prefixToken #leftBraceToken #rightBraceToken)
]
