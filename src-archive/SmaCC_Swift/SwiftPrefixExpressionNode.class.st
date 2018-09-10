Class {
	#name : #SwiftPrefixExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'operatorTokens',
		'identifierTokens',
		'lessThanTokens',
		'commaTokens',
		'greaterThanTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'leftBracketTokens',
		'expressions',
		'rightBracketTokens',
		'keyExpressions',
		'colonTokens',
		'valueExpressions',
		'__FILE__Token',
		'__LINE__Token',
		'__COLUMN__Token',
		'__FUNCTION__Token',
		'selfTokens',
		'periodTokens',
		'initTokens',
		'leftBraceTokens',
		'leftParenTokens',
		'rightParenTokens',
		'inoutTokens',
		'letTokens',
		'_Tokens',
		'protocolTokens',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'equalTokens',
		'varTokens',
		'rightBraceTokens',
		'inToken',
		'weakToken',
		'unownedToken',
		'unownedLeftParensafeRightParenToken',
		'unownedLeftParenunsafeRightParenToken',
		'statements',
		'dynamicTypeTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftPrefixExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftPrefixExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitPrefixExpression: self
]

{ #category : #generated }
SwiftPrefixExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftPrefixExpressionNode >> compositeTokenVariables [
	^ #(#operatorTokens #identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftPrefixExpressionNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftPrefixExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftPrefixExpressionNode >> initialize [
	super initialize.
	operatorTokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	keyExpressions := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	valueExpressions := OrderedCollection new: 2.
	selfTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	initTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	dynamicTypeTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftPrefixExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftPrefixExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftPrefixExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftPrefixExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftPrefixExpressionNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken)
]

{ #category : #generated }
SwiftPrefixExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftPrefixExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftPrefixExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrefixExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftPrefixExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
