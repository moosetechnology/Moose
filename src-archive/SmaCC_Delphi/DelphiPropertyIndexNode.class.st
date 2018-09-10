Class {
	#name : #DelphiPropertyIndexNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'indexToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyIndexNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyIndex: self
]

{ #category : #generated }
DelphiPropertyIndexNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyIndexNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyIndexNode >> indexToken [
	^ indexToken
]

{ #category : #generated }
DelphiPropertyIndexNode >> indexToken: aSmaCCToken [
	indexToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyIndexNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyIndexNode >> tokenVariables [
	^ #(#indexToken)
]
