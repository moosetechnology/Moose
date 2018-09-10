Class {
	#name : #SwiftMetatypeTypeNode,
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
SwiftMetatypeTypeNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitMetatypeType: self
]

{ #category : #generated }
SwiftMetatypeTypeNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> compositeTokenVariables [
	^ #(#leftBracketTokens #rightBracketTokens #colonTokens #minusGreaterThanTokens #periodTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #identifierTokens #commaTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftMetatypeTypeNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftMetatypeTypeNode >> initialize [
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
SwiftMetatypeTypeNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftMetatypeTypeNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftMetatypeTypeNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]
