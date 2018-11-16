Class {
	#name : #DelphiLiteralExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteralExpression: self
]

{ #category : #generated }
DelphiLiteralExpressionNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
DelphiLiteralExpressionNode >> value [
	^ value
]

{ #category : #generated }
DelphiLiteralExpressionNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
