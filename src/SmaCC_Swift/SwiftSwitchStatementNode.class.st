Class {
	#name : #SwiftSwitchStatementNode,
	#superclass : #SwiftBranchStatementNode,
	#instVars : [
		'switchToken',
		'expressions',
		'leftBraceTokens',
		'caseTokens',
		'_Tokens',
		'colonTokens',
		'identifierTokens',
		'leftParenTokens',
		'rightParenTokens',
		'leftBracketTokens',
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'rightBracketTokens',
		'minusGreaterThanTokens',
		'commaTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'varTokens',
		'letTokens',
		'isTokens',
		'asTokens',
		'whereTokens',
		'statements',
		'defaultTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSwitchStatementNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSwitchStatement: self
]

{ #category : #generated }
SwiftSwitchStatementNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> caseTokens [
	^ caseTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> caseTokens: anOrderedCollection [
	caseTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftSwitchStatementNode >> compositeTokenVariables [
	^ #(#leftBraceTokens #caseTokens #_Tokens #colonTokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #periodPeriodPeriodTokens #varTokens #letTokens #isTokens #asTokens #inoutTokens #whereTokens #defaultTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftSwitchStatementNode >> defaultTokens [
	^ defaultTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> defaultTokens: anOrderedCollection [
	defaultTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftSwitchStatementNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftSwitchStatementNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	caseTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
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
	varTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	isTokens := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	whereTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	defaultTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftSwitchStatementNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> isTokens [
	^ isTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> isTokens: anOrderedCollection [
	isTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftSwitchStatementNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftSwitchStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftSwitchStatementNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
SwiftSwitchStatementNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
SwiftSwitchStatementNode >> tokenVariables [
	^ #(#switchToken #semicolonToken)
]

{ #category : #generated }
SwiftSwitchStatementNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSwitchStatementNode >> whereTokens [
	^ whereTokens
]

{ #category : #generated }
SwiftSwitchStatementNode >> whereTokens: anOrderedCollection [
	whereTokens := anOrderedCollection
]
