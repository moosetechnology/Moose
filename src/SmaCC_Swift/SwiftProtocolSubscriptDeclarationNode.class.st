Class {
	#name : #SwiftProtocolSubscriptDeclarationNode,
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
		'subscriptToken',
		'inoutTokens',
		'letTokens',
		'colonTokens',
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'minusGreaterThanTokens',
		'commaTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'equalTokens',
		'expressions',
		'varTokens',
		'periodPeriodPeriodTokens',
		'getToken',
		'setToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolSubscriptDeclaration: self
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #inoutTokens #letTokens #colonTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #equalTokens #varTokens #periodPeriodPeriodTokens)
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> getToken [
	^ getToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftProtocolSubscriptDeclarationNode >> initialize [
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
	inoutTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> setToken [
	^ setToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> subscriptToken [
	^ subscriptToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> subscriptToken: aSmaCCToken [
	subscriptToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> tokenVariables [
	^ #(#subscriptToken #getToken #setToken)
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftProtocolSubscriptDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]
