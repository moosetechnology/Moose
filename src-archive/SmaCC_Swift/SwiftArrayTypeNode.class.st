Class {
	#name : #SwiftArrayTypeNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'leftBracketTokens',
		'identifierTokens',
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
SwiftArrayTypeNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftArrayTypeNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitArrayType: self
]

{ #category : #generated }
SwiftArrayTypeNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> compositeTokenVariables [
	^ #(#leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #identifierTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftArrayTypeNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftArrayTypeNode >> initialize [
	super initialize.
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
	identifierTokens := OrderedCollection new: 2.
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
SwiftArrayTypeNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftArrayTypeNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftArrayTypeNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]
