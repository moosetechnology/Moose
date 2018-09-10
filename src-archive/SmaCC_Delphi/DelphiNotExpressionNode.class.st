Class {
	#name : #DelphiNotExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'notToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiNotExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNotExpression: self
]

{ #category : #generated }
DelphiNotExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiNotExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiNotExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiNotExpressionNode >> notToken [
	^ notToken
]

{ #category : #generated }
DelphiNotExpressionNode >> notToken: aSmaCCToken [
	notToken := aSmaCCToken
]

{ #category : #generated }
DelphiNotExpressionNode >> tokenVariables [
	^ #(#notToken)
]
