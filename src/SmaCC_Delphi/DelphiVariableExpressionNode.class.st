Class {
	#name : #DelphiVariableExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiVariableExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableExpression: self
]

{ #category : #generated }
DelphiVariableExpressionNode >> name [
	^ name
]

{ #category : #generated }
DelphiVariableExpressionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiVariableExpressionNode >> tokenVariables [
	^ #(#name)
]
