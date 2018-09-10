Class {
	#name : #SwiftFunctionDeclarationNode,
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
		'classTokens',
		'mutatingTokens',
		'nonmutatingTokens',
		'overrideTokens',
		'staticTokens',
		'unownedTokens',
		'unownedLeftParensafeRightParenTokens',
		'unownedLeftParenunsafeRightParenTokens',
		'weakTokens',
		'funcToken',
		'lessThanTokens',
		'colonTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'protocolTokens',
		'whereToken',
		'equalEqualTokens',
		'periodPeriodPeriodTokens',
		'varTokens',
		'inoutTokens',
		'letTokens',
		'equalTokens',
		'expressions',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'block'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftFunctionDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFunctionDeclaration: self
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> block [
	^ block
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> classTokens [
	^ classTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> classTokens: anOrderedCollection [
	classTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #classTokens #mutatingTokens #nonmutatingTokens #overrideTokens #staticTokens #unownedTokens #unownedLeftParensafeRightParenTokens #unownedLeftParenunsafeRightParenTokens #weakTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #equalEqualTokens #periodPeriodPeriodTokens #varTokens #inoutTokens #letTokens #equalTokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #typeTokens)
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> funcToken [
	^ funcToken
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> funcToken: aSmaCCToken [
	funcToken := aSmaCCToken
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftFunctionDeclarationNode >> initialize [
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
	classTokens := OrderedCollection new: 2.
	mutatingTokens := OrderedCollection new: 2.
	nonmutatingTokens := OrderedCollection new: 2.
	overrideTokens := OrderedCollection new: 2.
	staticTokens := OrderedCollection new: 2.
	unownedTokens := OrderedCollection new: 2.
	unownedLeftParensafeRightParenTokens := OrderedCollection new: 2.
	unownedLeftParenunsafeRightParenTokens := OrderedCollection new: 2.
	weakTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	equalEqualTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> mutatingTokens [
	^ mutatingTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> mutatingTokens: anOrderedCollection [
	mutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> nonmutatingTokens [
	^ nonmutatingTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> nonmutatingTokens: anOrderedCollection [
	nonmutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> overrideTokens [
	^ overrideTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> overrideTokens: anOrderedCollection [
	overrideTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> staticTokens [
	^ staticTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> staticTokens: anOrderedCollection [
	staticTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> tokenVariables [
	^ #(#funcToken #whereToken)
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedLeftParensafeRightParenTokens [
	^ unownedLeftParensafeRightParenTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedLeftParensafeRightParenTokens: anOrderedCollection [
	unownedLeftParensafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedLeftParenunsafeRightParenTokens [
	^ unownedLeftParenunsafeRightParenTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedLeftParenunsafeRightParenTokens: anOrderedCollection [
	unownedLeftParenunsafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedTokens [
	^ unownedTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> unownedTokens: anOrderedCollection [
	unownedTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> weakTokens [
	^ weakTokens
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> weakTokens: anOrderedCollection [
	weakTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
SwiftFunctionDeclarationNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
