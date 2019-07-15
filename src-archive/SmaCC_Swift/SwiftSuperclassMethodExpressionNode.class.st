Class {
	#name : #SwiftSuperclassMethodExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'superToken',
		'periodToken',
		'identifierToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSuperclassMethodExpression: self
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassMethodExpressionNode >> tokenVariables [
	^ #(#superToken #periodToken #identifierToken)
]
