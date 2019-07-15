Class {
	#name : #DelphiPropertyDefaultNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'defaultToken',
		'expression',
		'nodefaultToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyDefaultNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyDefault: self
]

{ #category : #generated }
DelphiPropertyDefaultNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
DelphiPropertyDefaultNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyDefaultNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyDefaultNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyDefaultNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyDefaultNode >> nodefaultToken [
	^ nodefaultToken
]

{ #category : #generated }
DelphiPropertyDefaultNode >> nodefaultToken: aSmaCCToken [
	nodefaultToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyDefaultNode >> tokenVariables [
	^ #(#defaultToken #nodefaultToken)
]
