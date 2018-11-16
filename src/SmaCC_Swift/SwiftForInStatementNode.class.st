Class {
	#name : #SwiftForInStatementNode,
	#superclass : #SwiftLoopStatementNode,
	#instVars : [
		'forToken',
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
		'inToken',
		'block'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftForInStatementNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftForInStatementNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitForInStatement: self
]

{ #category : #generated }
SwiftForInStatementNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
SwiftForInStatementNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftForInStatementNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> block [
	^ block
]

{ #category : #generated }
SwiftForInStatementNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftForInStatementNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftForInStatementNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftForInStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> compositeTokenVariables [
	^ #(#_Tokens #colonTokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #periodPeriodPeriodTokens #inoutTokens #varTokens #letTokens #isTokens #asTokens)
]

{ #category : #generated }
SwiftForInStatementNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftForInStatementNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftForInStatementNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
SwiftForInStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
SwiftForInStatementNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftForInStatementNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftForInStatementNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftForInStatementNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftForInStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftForInStatementNode >> initialize [
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
SwiftForInStatementNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftForInStatementNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftForInStatementNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> isTokens [
	^ isTokens
]

{ #category : #generated }
SwiftForInStatementNode >> isTokens: anOrderedCollection [
	isTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftForInStatementNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftForInStatementNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftForInStatementNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftForInStatementNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftForInStatementNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftForInStatementNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftForInStatementNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftForInStatementNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftForInStatementNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftForInStatementNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftForInStatementNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftForInStatementNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftForInStatementNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftForInStatementNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftForInStatementNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftForInStatementNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> tokenVariables [
	^ #(#forToken #inToken #semicolonToken)
]

{ #category : #generated }
SwiftForInStatementNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftForInStatementNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftForInStatementNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftForInStatementNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]
