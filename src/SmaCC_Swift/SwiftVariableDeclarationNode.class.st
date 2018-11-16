Class {
	#name : #SwiftVariableDeclarationNode,
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
		'inializers',
		'commaTokens',
		'colonTokens',
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'blocks',
		'getToken',
		'setToken',
		'equalToken',
		'expression',
		'willSetToken',
		'didSetToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftVariableDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitVariableDeclaration: self
]

{ #category : #generated }
SwiftVariableDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> blocks [
	^ blocks
]

{ #category : #generated }
SwiftVariableDeclarationNode >> blocks: anOrderedCollection [
	self setParents: self blocks to: nil.
	blocks := anOrderedCollection.
	self setParents: self blocks to: self
]

{ #category : #generated }
SwiftVariableDeclarationNode >> classTokens [
	^ classTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> classTokens: anOrderedCollection [
	classTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> compositeNodeVariables [
	^ #(#inializers #blocks)
]

{ #category : #generated }
SwiftVariableDeclarationNode >> compositeTokenVariables [
	^ #(#_Tokens #identifierTokens #leftParenTokens #rightParenTokens #leftBracketTokens #rightBracketTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens #classTokens #mutatingTokens #nonmutatingTokens #overrideTokens #staticTokens #unownedTokens #unownedLeftParensafeRightParenTokens #unownedLeftParenunsafeRightParenTokens #weakTokens #commaTokens #colonTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #periodPeriodPeriodTokens #inoutTokens)
]

{ #category : #generated }
SwiftVariableDeclarationNode >> didSetToken [
	^ didSetToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> didSetToken: aSmaCCToken [
	didSetToken := aSmaCCToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftVariableDeclarationNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftVariableDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> getToken [
	^ getToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> inializers [
	^ inializers
]

{ #category : #generated }
SwiftVariableDeclarationNode >> inializers: anOrderedCollection [
	self setParents: self inializers to: nil.
	inializers := anOrderedCollection.
	self setParents: self inializers to: self
]

{ #category : #'generated-initialize-release' }
SwiftVariableDeclarationNode >> initialize [
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
	inializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	blocks := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftVariableDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> mutatingTokens [
	^ mutatingTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> mutatingTokens: anOrderedCollection [
	mutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> nonmutatingTokens [
	^ nonmutatingTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> nonmutatingTokens: anOrderedCollection [
	nonmutatingTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftVariableDeclarationNode >> overrideTokens [
	^ overrideTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> overrideTokens: anOrderedCollection [
	overrideTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> setToken [
	^ setToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> staticTokens [
	^ staticTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> staticTokens: anOrderedCollection [
	staticTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> tokenVariables [
	^ #(#varToken #getToken #setToken #equalToken #willSetToken #didSetToken)
]

{ #category : #generated }
SwiftVariableDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedLeftParensafeRightParenTokens [
	^ unownedLeftParensafeRightParenTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedLeftParensafeRightParenTokens: anOrderedCollection [
	unownedLeftParensafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedLeftParenunsafeRightParenTokens [
	^ unownedLeftParenunsafeRightParenTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedLeftParenunsafeRightParenTokens: anOrderedCollection [
	unownedLeftParenunsafeRightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedTokens [
	^ unownedTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> unownedTokens: anOrderedCollection [
	unownedTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> varToken [
	^ varToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> weakTokens [
	^ weakTokens
]

{ #category : #generated }
SwiftVariableDeclarationNode >> weakTokens: anOrderedCollection [
	weakTokens := anOrderedCollection
]

{ #category : #generated }
SwiftVariableDeclarationNode >> willSetToken [
	^ willSetToken
]

{ #category : #generated }
SwiftVariableDeclarationNode >> willSetToken: aSmaCCToken [
	willSetToken := aSmaCCToken
]
