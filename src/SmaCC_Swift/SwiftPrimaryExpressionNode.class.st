Class {
	#name : #SwiftPrimaryExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'identifierToken',
		'lessThanToken',
		'commaTokens',
		'greaterThanToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftPrimaryExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitPrimaryExpression: self
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SwiftPrimaryExpressionNode >> initialize [
	super initialize.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
SwiftPrimaryExpressionNode >> tokenVariables [
	^ #(#identifierToken #lessThanToken #greaterThanToken)
]
