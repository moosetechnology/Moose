Class {
	#name : #SwiftClassDeclarationNode,
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
		'classToken',
		'lessThanTokens',
		'colonTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'protocolTokens',
		'whereToken',
		'equalEqualTokens',
		'declarations'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftClassDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitClassDeclaration: self
]

{ #category : #generated }
SwiftClassDeclarationNode >> classToken [
	^ classToken
]

{ #category : #generated }
SwiftClassDeclarationNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
SwiftClassDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> compositeNodeVariables [
	^ #(#declarations)
]

{ #category : #generated }
SwiftClassDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #equalEqualTokens)
]

{ #category : #generated }
SwiftClassDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
SwiftClassDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
SwiftClassDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftClassDeclarationNode >> initialize [
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
	lessThanTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	equalEqualTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftClassDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftClassDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftClassDeclarationNode >> tokenVariables [
	^ #(#classToken #whereToken)
]

{ #category : #generated }
SwiftClassDeclarationNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
SwiftClassDeclarationNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
