Class {
	#name : #DelphiPlusExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'plus',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPlusExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPlusExpression: self
]

{ #category : #generated }
DelphiPlusExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPlusExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPlusExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPlusExpressionNode >> plus [
	^ plus
]

{ #category : #generated }
DelphiPlusExpressionNode >> plus: aSmaCCToken [
	plus := aSmaCCToken
]

{ #category : #generated }
DelphiPlusExpressionNode >> tokenVariables [
	^ #(#plus)
]
