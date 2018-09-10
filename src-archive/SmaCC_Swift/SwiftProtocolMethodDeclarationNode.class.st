Class {
	#name : #SwiftProtocolMethodDeclarationNode,
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
		'typeTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolMethodDeclaration: self
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> classTokens [
	^ classTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> classTokens: anOrderedCollection [
	classTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #classTokens #mutatingTokens #nonmutatingTokens #overrideTokens #staticTokens #unownedTokens #unownedLeftParensafeRightParenTokens #unownedLeftParenunsafeRightParenTokens #weakTokens #lessThanTokens #colonTokens #greaterThanTokens #commaTokens #periodTokens #protocolTokens #equalEqualTokens #periodPeriodPeriodTokens #varTokens #inoutTokens #letTokens #equalTokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #typeTokens)
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> equalEqualTokens [
	^ equalEqualTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> equalEqualTokens: anOrderedCollection [
	equalEqualTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> funcToken [
	^ funcToken
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> funcToken: aSmaCCToken [
	funcToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftProtocolMethodDeclarationNode >> initialize [
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
SwiftProtocolMethodDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> mutatingTokens [
	^ mutatingTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> mutatingTokens: anOrderedCollection [
	mutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> nonmutatingTokens [
	^ nonmutatingTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> nonmutatingTokens: anOrderedCollection [
	nonmutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> overrideTokens [
	^ overrideTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> overrideTokens: anOrderedCollection [
	overrideTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> staticTokens [
	^ staticTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> staticTokens: anOrderedCollection [
	staticTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> tokenVariables [
	^ #(#funcToken #whereToken)
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedLeftParensafeRightParenTokens [
	^ unownedLeftParensafeRightParenTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedLeftParensafeRightParenTokens: anOrderedCollection [
	unownedLeftParensafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedLeftParenunsafeRightParenTokens [
	^ unownedLeftParenunsafeRightParenTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedLeftParenunsafeRightParenTokens: anOrderedCollection [
	unownedLeftParenunsafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedTokens [
	^ unownedTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> unownedTokens: anOrderedCollection [
	unownedTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> weakTokens [
	^ weakTokens
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> weakTokens: anOrderedCollection [
	weakTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
SwiftProtocolMethodDeclarationNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
