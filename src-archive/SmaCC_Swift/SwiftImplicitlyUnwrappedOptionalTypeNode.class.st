Class {
	#name : #SwiftImplicitlyUnwrappedOptionalTypeNode,
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
SwiftImplicitlyUnwrappedOptionalTypeNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitImplicitlyUnwrappedOptionalType: self
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> compositeTokenVariables [
	^ #(#leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #identifierTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftImplicitlyUnwrappedOptionalTypeNode >> initialize [
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
SwiftImplicitlyUnwrappedOptionalTypeNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftImplicitlyUnwrappedOptionalTypeNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]
