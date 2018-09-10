Class {
	#name : #SwiftBinaryExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
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
		'operatorTokens',
		'inToken',
		'weakToken',
		'unownedToken',
		'unownedLeftParensafeRightParenToken',
		'unownedLeftParenunsafeRightParenToken',
		'statements',
		'dynamicTypeTokens',
		'andToken',
		'operators'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftBinaryExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftBinaryExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBinaryExpression: self
]

{ #category : #generated }
SwiftBinaryExpressionNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> compositeNodeVariables [
	^ #(#statements #operators)
]

{ #category : #generated }
SwiftBinaryExpressionNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftBinaryExpressionNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftBinaryExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftBinaryExpressionNode >> initialize [
	super initialize.
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
	operatorTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	dynamicTypeTokens := OrderedCollection new: 2.
	operators := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftBinaryExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftBinaryExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> operators [
	^ operators
]

{ #category : #generated }
SwiftBinaryExpressionNode >> operators: anOrderedCollection [
	self setParents: self operators to: nil.
	operators := anOrderedCollection.
	self setParents: self operators to: self
]

{ #category : #generated }
SwiftBinaryExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftBinaryExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftBinaryExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftBinaryExpressionNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken #andToken)
]

{ #category : #generated }
SwiftBinaryExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftBinaryExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftBinaryExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftBinaryExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
