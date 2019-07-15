Class {
	#name : #SwiftProtocolPropertyDeclarationNode,
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
		'varToken',
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
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'getToken',
		'setToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolPropertyDeclaration: self
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> classTokens [
	^ classTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> classTokens: anOrderedCollection [
	classTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #classTokens #mutatingTokens #nonmutatingTokens #overrideTokens #staticTokens #unownedTokens #unownedLeftParensafeRightParenTokens #unownedLeftParenunsafeRightParenTokens #weakTokens #colonTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #commaTokens #periodPeriodPeriodTokens #inoutTokens)
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> getToken [
	^ getToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftProtocolPropertyDeclarationNode >> initialize [
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
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> mutatingTokens [
	^ mutatingTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> mutatingTokens: anOrderedCollection [
	mutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> nonmutatingTokens [
	^ nonmutatingTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> nonmutatingTokens: anOrderedCollection [
	nonmutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> overrideTokens [
	^ overrideTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> overrideTokens: anOrderedCollection [
	overrideTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> setToken [
	^ setToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> staticTokens [
	^ staticTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> staticTokens: anOrderedCollection [
	staticTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> tokenVariables [
	^ #(#varToken #getToken #setToken)
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedLeftParensafeRightParenTokens [
	^ unownedLeftParensafeRightParenTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedLeftParensafeRightParenTokens: anOrderedCollection [
	unownedLeftParensafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedLeftParenunsafeRightParenTokens [
	^ unownedLeftParenunsafeRightParenTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedLeftParenunsafeRightParenTokens: anOrderedCollection [
	unownedLeftParenunsafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedTokens [
	^ unownedTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> unownedTokens: anOrderedCollection [
	unownedTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> varToken [
	^ varToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> weakTokens [
	^ weakTokens
]

{ #category : #generated }
SwiftProtocolPropertyDeclarationNode >> weakTokens: anOrderedCollection [
	weakTokens := anOrderedCollection
]
