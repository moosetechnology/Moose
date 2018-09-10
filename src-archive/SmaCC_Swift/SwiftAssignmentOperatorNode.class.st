Class {
	#name : #SwiftAssignmentOperatorNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'equalTokens',
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
SwiftAssignmentOperatorNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitAssignmentOperator: self
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> compositeTokenVariables [
	^ #(#equalTokens #identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftAssignmentOperatorNode >> initialize [
	super initialize.
	equalTokens := OrderedCollection new: 2.
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
	varTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	dynamicTypeTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> tokenVariables [
	^ #(#__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken #andToken)
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftAssignmentOperatorNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
