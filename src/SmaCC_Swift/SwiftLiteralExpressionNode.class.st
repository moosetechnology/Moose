Class {
	#name : #SwiftLiteralExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'integer_literalToken',
		'floating_point_literalToken',
		'full_string_literalToken',
		'leftBracketToken',
		'expressions',
		'commaTokens',
		'rightBracketToken',
		'keyExpressions',
		'colonTokens',
		'valueExpressions',
		'__FILE__Token',
		'__LINE__Token',
		'__COLUMN__Token',
		'__FUNCTION__Token'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftLiteralExpressionNode >> __COLUMN__Token [
	^ __COLUMN__Token
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __COLUMN__Token: aSmaCCToken [
	__COLUMN__Token := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __FILE__Token [
	^ __FILE__Token
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __FILE__Token: aSmaCCToken [
	__FILE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __FUNCTION__Token [
	^ __FUNCTION__Token
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __FUNCTION__Token: aSmaCCToken [
	__FUNCTION__Token := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __LINE__Token [
	^ __LINE__Token
]

{ #category : #generated }
SwiftLiteralExpressionNode >> __LINE__Token: aSmaCCToken [
	__LINE__Token := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitLiteralExpression: self
]

{ #category : #generated }
SwiftLiteralExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftLiteralExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftLiteralExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftLiteralExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftLiteralExpressionNode >> compositeTokenVariables [
	^ #(#commaTokens #colonTokens)
]

{ #category : #generated }
SwiftLiteralExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftLiteralExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftLiteralExpressionNode >> floating_point_literalToken [
	^ floating_point_literalToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> floating_point_literalToken: aSmaCCToken [
	floating_point_literalToken := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> full_string_literalToken [
	^ full_string_literalToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> full_string_literalToken: aSmaCCToken [
	full_string_literalToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftLiteralExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	keyExpressions := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	valueExpressions := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftLiteralExpressionNode >> integer_literalToken [
	^ integer_literalToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> integer_literalToken: aSmaCCToken [
	integer_literalToken := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> keyExpressions [
	^ keyExpressions
]

{ #category : #generated }
SwiftLiteralExpressionNode >> keyExpressions: anOrderedCollection [
	keyExpressions := anOrderedCollection
]

{ #category : #generated }
SwiftLiteralExpressionNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> otherVariables [
	^ #(#expressions #keyExpressions #valueExpressions)
]

{ #category : #generated }
SwiftLiteralExpressionNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
SwiftLiteralExpressionNode >> tokenVariables [
	^ #(#integer_literalToken #floating_point_literalToken #full_string_literalToken #leftBracketToken #rightBracketToken #__FILE__Token #__LINE__Token #__COLUMN__Token #__FUNCTION__Token)
]

{ #category : #generated }
SwiftLiteralExpressionNode >> valueExpressions [
	^ valueExpressions
]

{ #category : #generated }
SwiftLiteralExpressionNode >> valueExpressions: anOrderedCollection [
	valueExpressions := anOrderedCollection
]
