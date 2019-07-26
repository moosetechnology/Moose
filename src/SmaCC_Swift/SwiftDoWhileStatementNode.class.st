Class {
	#name : #SwiftDoWhileStatementNode,
	#superclass : #SwiftLoopStatementNode,
	#instVars : [
		'doToken',
		'block',
		'whileToken',
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
SwiftDoWhileStatementNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftDoWhileStatementNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitDoWhileStatement: self
]

{ #category : #generated }
SwiftDoWhileStatementNode >> andToken [
	^ andToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> block [
	^ block
]

{ #category : #generated }
SwiftDoWhileStatementNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftDoWhileStatementNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> compositeNodeVariables [
	^ #(#statements #operators)
]

{ #category : #generated }
SwiftDoWhileStatementNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #leftBracketTokens #rightBracketTokens #colonTokens #selfTokens #periodTokens #initTokens #leftBraceTokens #leftParenTokens #rightParenTokens #inoutTokens #letTokens #_Tokens #minusGreaterThanTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #operatorTokens #dynamicTypeTokens)
]

{ #category : #generated }
SwiftDoWhileStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> dynamicTypeTokens [
	^ dynamicTypeTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> dynamicTypeTokens: anOrderedCollection [
	dynamicTypeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftDoWhileStatementNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> initTokens [
	^ initTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> initTokens: anOrderedCollection [
	initTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftDoWhileStatementNode >> initialize [
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
SwiftDoWhileStatementNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftDoWhileStatementNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftDoWhileStatementNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> operators [
	^ operators
]

{ #category : #generated }
SwiftDoWhileStatementNode >> operators: anOrderedCollection [
	self setParents: self operators to: nil.
	operators := anOrderedCollection.
	self setParents: self operators to: self
]

{ #category : #generated }
SwiftDoWhileStatementNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftDoWhileStatementNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> selfTokens [
	^ selfTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> selfTokens: anOrderedCollection [
	selfTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftDoWhileStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftDoWhileStatementNode >> tokenVariables [
	^ #(#doToken #whileToken #__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token #inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken #andToken #semicolonToken)
]

{ #category : #generated }
SwiftDoWhileStatementNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftDoWhileStatementNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftDoWhileStatementNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftDoWhileStatementNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
SwiftDoWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
