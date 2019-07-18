Class {
	#name : #SwiftInitializerExpressionNode,
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
		'dynamicTypeTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftInitializerExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftInitializerExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInitializerExpression: self
]

{ #category : #generated }
SwiftInitializerExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftInitializerExpressionNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftInitializerExpressionNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftInitializerExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftInitializerExpressionNode >> initialize [
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
]

{ #category : #generated }
SwiftInitializerExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftInitializerExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftInitializerExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftInitializerExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftInitializerExpressionNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken)
]

{ #category : #generated }
SwiftInitializerExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftInitializerExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftInitializerExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftInitializerExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftInitializerExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
