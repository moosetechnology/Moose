Class {
	#name : #DelphiPropertyExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'expression',
		'period',
		'name'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyExpression: self
]

{ #category : #generated }
DelphiPropertyExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyExpressionNode >> name [
	^ name
]

{ #category : #generated }
DelphiPropertyExpressionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyExpressionNode >> period [
	^ period
]

{ #category : #generated }
DelphiPropertyExpressionNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyExpressionNode >> tokenVariables [
	^ #(#period #name)
]
