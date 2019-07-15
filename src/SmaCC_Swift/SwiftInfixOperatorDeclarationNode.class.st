Class {
	#name : #SwiftInfixOperatorDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'operatorTokens',
		'infixToken',
		'leftBraceToken',
		'precedenceToken',
		'integer_literalToken',
		'associativityToken',
		'leftToken',
		'rightToken',
		'noneToken',
		'rightBraceToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInfixOperatorDeclaration: self
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> associativityToken [
	^ associativityToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> associativityToken: aSmaCCToken [
	associativityToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> compositeTokenVariables [
	^ #(#operatorTokens)
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> infixToken [
	^ infixToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> infixToken: aSmaCCToken [
	infixToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftInfixOperatorDeclarationNode >> initialize [
	super initialize.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> integer_literalToken [
	^ integer_literalToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> integer_literalToken: aSmaCCToken [
	integer_literalToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> leftToken [
	^ leftToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> leftToken: aSmaCCToken [
	leftToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> noneToken [
	^ noneToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> noneToken: aSmaCCToken [
	noneToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> precedenceToken [
	^ precedenceToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> precedenceToken: aSmaCCToken [
	precedenceToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> rightToken [
	^ rightToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> rightToken: aSmaCCToken [
	rightToken := aSmaCCToken
]

{ #category : #generated }
SwiftInfixOperatorDeclarationNode >> tokenVariables [
	^ #(#infixToken #leftBraceToken #precedenceToken #integer_literalToken #associativityToken #leftToken #rightToken #noneToken #rightBraceToken)
]
