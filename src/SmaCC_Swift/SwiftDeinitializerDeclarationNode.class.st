Class {
	#name : #SwiftDeinitializerDeclarationNode,
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
		'deinitToken',
		'block'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitDeinitializerDeclaration: self
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> block [
	^ block
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> deinitToken [
	^ deinitToken
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> deinitToken: aSmaCCToken [
	deinitToken := aSmaCCToken
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftDeinitializerDeclarationNode >> initialize [
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
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDeinitializerDeclarationNode >> tokenVariables [
	^ #(#deinitToken)
]
