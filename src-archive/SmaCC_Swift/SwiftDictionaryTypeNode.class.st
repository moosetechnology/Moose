Class {
	#name : #SwiftDictionaryTypeNode,
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
SwiftDictionaryTypeNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitDictionaryType: self
]

{ #category : #generated }
SwiftDictionaryTypeNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> compositeTokenVariables [
	^ #(#leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #identifierTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftDictionaryTypeNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftDictionaryTypeNode >> initialize [
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
SwiftDictionaryTypeNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDictionaryTypeNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftDictionaryTypeNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]
