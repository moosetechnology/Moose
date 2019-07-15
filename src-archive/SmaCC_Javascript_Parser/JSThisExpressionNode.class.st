Class {
	#name : #JSThisExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'thisToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSThisExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThisExpression: self
]

{ #category : #generated }
JSThisExpressionNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
JSThisExpressionNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
JSThisExpressionNode >> tokenVariables [
	^ #(#thisToken)
]
