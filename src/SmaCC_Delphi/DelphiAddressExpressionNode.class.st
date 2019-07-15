Class {
	#name : #DelphiAddressExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'atToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAddressExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAddressExpression: self
]

{ #category : #generated }
DelphiAddressExpressionNode >> atToken [
	^ atToken
]

{ #category : #generated }
DelphiAddressExpressionNode >> atToken: aSmaCCToken [
	atToken := aSmaCCToken
]

{ #category : #generated }
DelphiAddressExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiAddressExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiAddressExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiAddressExpressionNode >> tokenVariables [
	^ #(#atToken)
]
