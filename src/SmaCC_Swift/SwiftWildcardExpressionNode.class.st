Class {
	#name : #SwiftWildcardExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'_Token'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftWildcardExpressionNode >> _Token [
	^ _Token
]

{ #category : #generated }
SwiftWildcardExpressionNode >> _Token: aSmaCCToken [
	_Token := aSmaCCToken
]

{ #category : #generated }
SwiftWildcardExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitWildcardExpression: self
]

{ #category : #generated }
SwiftWildcardExpressionNode >> tokenVariables [
	^ #(#_Token)
]
