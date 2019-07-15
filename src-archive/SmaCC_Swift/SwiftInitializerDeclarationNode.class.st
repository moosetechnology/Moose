Class {
	#name : #SwiftInitializerDeclarationNode,
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
		'periodPeriodPeriodTokens',
		'block'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftInitializerDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInitializerDeclaration: self
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> block [
	^ block
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #equalEqualTokens #inoutTokens #letTokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens)
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> convenienceToken [
	^ convenienceToken
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> convenienceToken: aSmaCCToken [
	convenienceToken := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> initToken [
	^ initToken
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> initToken: aSmaCCToken [
	initToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftInitializerDeclarationNode >> initialize [
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
SwiftInitializerDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> tokenVariables [
	^ #(#convenienceToken #initToken #whereToken)
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
SwiftInitializerDeclarationNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
