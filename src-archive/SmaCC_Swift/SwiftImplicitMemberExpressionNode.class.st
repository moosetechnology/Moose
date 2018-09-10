Class {
	#name : #SwiftImplicitMemberExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'periodToken',
		'identifierToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitImplicitMemberExpression: self
]

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
SwiftImplicitMemberExpressionNode >> tokenVariables [
	^ #(#periodToken #identifierToken)
]
