Class {
	#name : #SwiftFunctionCallExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'expressions',
		'leftParenTokens',
		'identifierTokens',
		'colonTokens',
		'commaTokens',
		'rightParenTokens',
		'leftBraceTokens',
		'inoutTokens',
		'letTokens',
		'_Tokens',
		'leftBracketTokens',
		'periodTokens',
		'protocolTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'rightBracketTokens',
		'minusGreaterThanTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'equalTokens',
		'varTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens',
		'inToken',
		'weakToken',
		'unownedToken',
		'unownedLeftParensafeRightParenToken',
		'unownedLeftParenunsafeRightParenToken',
		'statements'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftFunctionCallExpressionNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFunctionCallExpression: self
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> compositeTokenVariables [
	^ #(#leftParenTokens #identifierTokens #colonTokens #commaTokens #rightParenTokens #leftBraceTokens #inoutTokens #letTokens #_Tokens #leftBracketTokens #rightBracketTokens #minusGreaterThanTokens #periodTokens #questionMarkTokens #bangTokens #protocolTokens #lessThanTokens #greaterThanTokens #typeTokens #periodPeriodPeriodTokens #equalTokens #varTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> inToken [
	^ inToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftFunctionCallExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	varTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> tokenVariables [
	^ #(#inToken #weakToken #unownedToken #unownedLeftParensafeRightParenToken #unownedLeftParenunsafeRightParenToken)
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedLeftParensafeRightParenToken [
	^ unownedLeftParensafeRightParenToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedLeftParensafeRightParenToken: aSmaCCToken [
	unownedLeftParensafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedLeftParenunsafeRightParenToken [
	^ unownedLeftParenunsafeRightParenToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedLeftParenunsafeRightParenToken: aSmaCCToken [
	unownedLeftParenunsafeRightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedToken [
	^ unownedToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> unownedToken: aSmaCCToken [
	unownedToken := aSmaCCToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> varTokens [
	^ varTokens
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> varTokens: anOrderedCollection [
	varTokens := anOrderedCollection
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> weakToken [
	^ weakToken
]

{ #category : #generated }
SwiftFunctionCallExpressionNode >> weakToken: aSmaCCToken [
	weakToken := aSmaCCToken
]
