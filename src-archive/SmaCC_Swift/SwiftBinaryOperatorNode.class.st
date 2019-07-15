Class {
	#name : #SwiftBinaryOperatorNode,
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
		'dynamicTypeTokens',
		'andToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftBinaryOperatorNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftBinaryOperatorNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBinaryOperator: self
]

{ #category : #generated }
SwiftBinaryOperatorNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftBinaryOperatorNode >> compositeTokenVariables [
	^ #(#operatorTokens #identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftBinaryOperatorNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftBinaryOperatorNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftBinaryOperatorNode >> initialize [
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
SwiftBinaryOperatorNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftBinaryOperatorNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftBinaryOperatorNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftBinaryOperatorNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftBinaryOperatorNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken #andToken)
]

{ #category : #generated }
SwiftBinaryOperatorNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftBinaryOperatorNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftBinaryOperatorNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftBinaryOperatorNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftBinaryOperatorNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
