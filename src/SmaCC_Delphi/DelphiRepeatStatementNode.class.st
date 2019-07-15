Class {
	#name : #DelphiRepeatStatementNode,
	#superclass : #DelphiMultiStatementNode,
	#instVars : [
		'repeatToken',
		'untilToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRepeatStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRepeatStatement: self
]

{ #category : #generated }
DelphiRepeatStatementNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiRepeatStatementNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiRepeatStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiRepeatStatementNode >> repeatToken [
	^ repeatToken
]

{ #category : #generated }
DelphiRepeatStatementNode >> repeatToken: aSmaCCToken [
	repeatToken := aSmaCCToken
]

{ #category : #generated }
DelphiRepeatStatementNode >> tokenVariables [
	^ #(#repeatToken #untilToken)
]

{ #category : #generated }
DelphiRepeatStatementNode >> untilToken [
	^ untilToken
]

{ #category : #generated }
DelphiRepeatStatementNode >> untilToken: aSmaCCToken [
	untilToken := aSmaCCToken
]
