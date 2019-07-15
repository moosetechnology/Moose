Class {
	#name : #SwiftCondionalOperatorNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'questionMarkTokens',
		'trueExpression',
		'colonTokens',
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
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'equalTokens',
		'varTokens',
		'rightBraceTokens',
		'operatorTokens',
		'inToken',
		'weakToken',
		'unownedToken',
		'unownedLeftParensafeRightParenToken',
		'unownedLeftParenunsafeRightParenToken',
		'statements',
		'dynamicTypeTokens',
		'andToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftCondionalOperatorNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftCondionalOperatorNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitCondionalOperator: self
]

{ #category : #generated }
SwiftCondionalOperatorNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftCondionalOperatorNode >> compositeTokenVariables [
	^ #(#questionMarkTokens #colonTokens #identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftCondionalOperatorNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftCondionalOperatorNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftCondionalOperatorNode >> initialize [
	super initialize.
	questionMarkTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
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
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	dynamicTypeTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftCondionalOperatorNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftCondionalOperatorNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> otherVariables [
	^ #(#trueExpression #expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftCondionalOperatorNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftCondionalOperatorNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftCondionalOperatorNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken #andToken)
]

{ #category : #generated }
SwiftCondionalOperatorNode >> trueExpression [
	^ trueExpression
]

{ #category : #generated }
SwiftCondionalOperatorNode >> trueExpression: anObject [
	trueExpression := anObject
]

{ #category : #generated }
SwiftCondionalOperatorNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftCondionalOperatorNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftCondionalOperatorNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftCondionalOperatorNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftCondionalOperatorNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
