Class {
	#name : #SwiftSuperclassInitializerExpressionNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'superToken',
		'periodToken',
		'initToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSuperclassInitializerExpression: self
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> initToken [
	^ initToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> initToken: aSmaCCToken [
	initToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
SwiftSuperclassInitializerExpressionNode >> tokenVariables [
	^ #(#superToken #periodToken #initToken)
]
