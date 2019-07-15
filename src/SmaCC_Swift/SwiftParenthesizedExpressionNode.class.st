Class {
	#name : #SwiftParenthesizedExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'leftParenToken',
		'expressions',
		'identifierTokens',
		'colonTokens',
		'commaTokens',
		'rightParenToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftParenthesizedExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParenthesizedExpression: self
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> compositeTokenVariables [
	^ #(#identifierTokens #colonTokens #commaTokens)
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> expressions: anOrderedCollection [
	expressions := anOrderedCollection
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftParenthesizedExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> otherVariables [
	^ #(#expressions)
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
SwiftParenthesizedExpressionNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
