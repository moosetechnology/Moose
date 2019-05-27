Class {
	#name : #SwiftSubscriptDeclarationNode,
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
		'blocks',
		'getToken',
		'setToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSubscriptDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSubscriptDeclaration: self
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> blocks [
	^ blocks
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> blocks: anOrderedCollection [
	self setParents: self blocks to: nil.
	blocks := anOrderedCollection.
	self setParents: self blocks to: self
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> compositeNodeVariables [
	^ #(#blocks)
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #inoutTokens #letTokens #colonTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #equalTokens #varTokens #periodPeriodPeriodTokens)
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> getToken [
	^ getToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftSubscriptDeclarationNode >> initialize [
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
	blocks := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> setToken [
	^ setToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> subscriptToken [
	^ subscriptToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> subscriptToken: aSmaCCToken [
	subscriptToken := aSmaCCToken
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> tokenVariables [
	^ #(#subscriptToken #getToken #setToken)
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftSubscriptDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]
