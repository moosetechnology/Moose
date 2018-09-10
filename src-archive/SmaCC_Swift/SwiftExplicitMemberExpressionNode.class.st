Class {
	#name : #SwiftExplicitMemberExpressionNode,
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
SwiftExplicitMemberExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitExplicitMemberExpression: self
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftExplicitMemberExpressionNode >> initialize [
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
SwiftExplicitMemberExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken)
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftExplicitMemberExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
