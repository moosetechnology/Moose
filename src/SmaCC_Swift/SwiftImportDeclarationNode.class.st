Class {
	#name : #SwiftImportDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'_Tokens',
		'identifierTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBracketTokens',
		'rightBracketTokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens',
		'importToken',
		'typealiasToken',
		'structToken',
		'classToken',
		'enumToken',
		'protocolToken',
		'varToken',
		'funcToken',
		'periodTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftImportDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitImportDeclaration: self
]

{ #category : #generated }
SwiftImportDeclarationNode >> classToken [
	^ classToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #periodTokens)
]

{ #category : #generated }
SwiftImportDeclarationNode >> enumToken [
	^ enumToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> enumToken: aSmaCCToken [
	enumToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> funcToken [
	^ funcToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> funcToken: aSmaCCToken [
	funcToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> importToken [
	^ importToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> importToken: aSmaCCToken [
	importToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftImportDeclarationNode >> initialize [
	super initialize.
	_Tokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftImportDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> protocolToken [
	^ protocolToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> protocolToken: aSmaCCToken [
	protocolToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftImportDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImportDeclarationNode >> structToken [
	^ structToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> structToken: aSmaCCToken [
	structToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> tokenVariables [
	^ #(#importToken #typealiasToken #structToken #classToken #enumToken #protocolToken #varToken #funcToken)
]

{ #category : #generated }
SwiftImportDeclarationNode >> typealiasToken [
	^ typealiasToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> typealiasToken: aSmaCCToken [
	typealiasToken := aSmaCCToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> varToken [
	^ varToken
]

{ #category : #generated }
SwiftImportDeclarationNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]
