Class {
	#name : #JSNewTargetExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'newToken',
		'periodToken',
		'targetToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNewTargetExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNewTargetExpression: self
]

{ #category : #generated }
JSNewTargetExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> targetToken [
	^ targetToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> targetToken: aSmaCCToken [
	targetToken := aSmaCCToken
]

{ #category : #generated }
JSNewTargetExpressionNode >> tokenVariables [
	^ #(#newToken #periodToken #targetToken)
]
