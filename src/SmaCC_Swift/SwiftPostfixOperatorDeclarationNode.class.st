Class {
	#name : #SwiftPostfixOperatorDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'operatorTokens',
		'postfixToken',
		'leftBraceToken',
		'rightBraceToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitPostfixOperatorDeclaration: self
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> compositeTokenVariables [
	^ #(#operatorTokens)
]

{ #category : #'generated-initialize-release' }
SwiftPostfixOperatorDeclarationNode >> initialize [
	super initialize.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> postfixToken [
	^ postfixToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> postfixToken: aSmaCCToken [
	postfixToken := aSmaCCToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftPostfixOperatorDeclarationNode >> tokenVariables [
	^ #(#postfixToken #leftBraceToken #rightBraceToken)
]
