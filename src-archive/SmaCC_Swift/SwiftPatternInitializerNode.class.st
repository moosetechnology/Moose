Class {
	#name : #SwiftPatternInitializerNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'_Tokens',
		'colonTokens',
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
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'minusGreaterThanTokens',
		'commaTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'varTokens',
		'letTokens',
		'expressions',
		'isTokens',
		'asTokens',
		'equalToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftPatternInitializerNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitPatternInitializer: self
]

{ #category : #generated }
SwiftPatternInitializerNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> compositeTokenVariables [
	^ #(#_Tokens #colonTokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #periodPeriodPeriodTokens #inoutTokens #varTokens #letTokens #isTokens #asTokens)
]

{ #category : #generated }
SwiftPatternInitializerNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
SwiftPatternInitializerNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
SwiftPatternInitializerNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftPatternInitializerNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftPatternInitializerNode >> initialize [
	super initialize.
	_Tokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
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
	minusGreaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	isTokens := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftPatternInitializerNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> isTokens [
	^ isTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> isTokens: anOrderedCollection [
	isTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftPatternInitializerNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> tokenVariables [
	^ #(#equalToken)
]

{ #category : #generated }
SwiftPatternInitializerNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPatternInitializerNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftPatternInitializerNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]
