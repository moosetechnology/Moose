Class {
	#name : #SwiftTypealiasDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'typealiasToken',
		'identifierTokens',
		'equalToken',
		'leftBracketTokens',
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'rightBracketTokens',
		'colonTokens',
		'minusGreaterThanTokens',
		'commaTokens',
		'leftParenTokens',
		'rightParenTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'_Tokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftTypealiasDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitTypealiasDeclaration: self
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> compositeTokenVariables [
	^ #(#identifierTokens #leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftTypealiasDeclarationNode >> initialize [
	super initialize.
	identifierTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> tokenVariables [
	^ #(#typealiasToken #equalToken)
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> typealiasToken [
	^ typealiasToken
]

{ #category : #generated }
SwiftTypealiasDeclarationNode >> typealiasToken: aSmaCCToken [
	typealiasToken := aSmaCCToken
]
