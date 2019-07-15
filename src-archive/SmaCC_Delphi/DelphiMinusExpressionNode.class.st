Class {
	#name : #DelphiMinusExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'minus',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMinusExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMinusExpression: self
]

{ #category : #generated }
DelphiMinusExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiMinusExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiMinusExpressionNode >> minus [
	^ minus
]

{ #category : #generated }
DelphiMinusExpressionNode >> minus: aSmaCCToken [
	minus := aSmaCCToken
]

{ #category : #generated }
DelphiMinusExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiMinusExpressionNode >> tokenVariables [
	^ #(#minus)
]
