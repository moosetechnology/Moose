Class {
	#name : #JSNameExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNameExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNameExpression: self
]

{ #category : #generated }
JSNameExpressionNode >> name [
	^ name
]

{ #category : #generated }
JSNameExpressionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSNameExpressionNode >> tokenVariables [
	^ #(#name)
]
