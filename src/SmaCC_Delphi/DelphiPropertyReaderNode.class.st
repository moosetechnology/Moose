Class {
	#name : #DelphiPropertyReaderNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'readToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyReaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyReader: self
]

{ #category : #generated }
DelphiPropertyReaderNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyReaderNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyReaderNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyReaderNode >> readToken [
	^ readToken
]

{ #category : #generated }
DelphiPropertyReaderNode >> readToken: aSmaCCToken [
	readToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyReaderNode >> tokenVariables [
	^ #(#readToken)
]
