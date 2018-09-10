Class {
	#name : #SwiftDynamicTypeExpressionNode,
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
SwiftDynamicTypeExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitDynamicTypeExpression: self
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftDynamicTypeExpressionNode >> initialize [
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
SwiftDynamicTypeExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken)
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftDynamicTypeExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
