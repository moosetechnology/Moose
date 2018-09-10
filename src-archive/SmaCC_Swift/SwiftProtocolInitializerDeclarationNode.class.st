Class {
	#name : #SwiftProtocolInitializerDeclarationNode,
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
		'convenienceToken',
		'initToken',
		'lessThanTokens',
		'colonTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'protocolTokens',
		'whereToken',
		'equalEqualTokens',
		'inoutTokens',
		'letTokens',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'equalTokens',
		'expressions',
		'varTokens',
		'periodPeriodPeriodTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolInitializerDeclaration: self
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #equalEqualTokens #inoutTokens #letTokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens)
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> convenienceToken [
	^ convenienceToken
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> convenienceToken: aSmaCCToken [
	convenienceToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> initToken [
	^ initToken
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> initToken: aSmaCCToken [
	initToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftProtocolInitializerDeclarationNode >> initialize [
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
	lessThanTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	equalEqualTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> tokenVariables [
	^ #(#convenienceToken #initToken #whereToken)
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
SwiftProtocolInitializerDeclarationNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
