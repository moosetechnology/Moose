Class {
	#name : #SwiftOptionalTypeNode,
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
SwiftOptionalTypeNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitOptionalType: self
]

{ #category : #generated }
SwiftOptionalTypeNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> compositeTokenVariables [
	^ #(#leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #identifierTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftOptionalTypeNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftOptionalTypeNode >> initialize [
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
SwiftOptionalTypeNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftOptionalTypeNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftOptionalTypeNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]
