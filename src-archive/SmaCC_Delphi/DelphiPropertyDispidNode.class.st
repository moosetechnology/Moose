Class {
	#name : #DelphiPropertyDispidNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'dispidToken',
		'expression',
		'readOnlyToken',
		'writeOnlyToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyDispidNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyDispid: self
]

{ #category : #generated }
DelphiPropertyDispidNode >> dispidToken [
	^ dispidToken
]

{ #category : #generated }
DelphiPropertyDispidNode >> dispidToken: aSmaCCToken [
	dispidToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyDispidNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyDispidNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyDispidNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyDispidNode >> readOnlyToken [
	^ readOnlyToken
]

{ #category : #generated }
DelphiPropertyDispidNode >> readOnlyToken: aSmaCCToken [
	readOnlyToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyDispidNode >> tokenVariables [
	^ #(#dispidToken #readOnlyToken #writeOnlyToken)
]

{ #category : #generated }
DelphiPropertyDispidNode >> writeOnlyToken [
	^ writeOnlyToken
]

{ #category : #generated }
DelphiPropertyDispidNode >> writeOnlyToken: aSmaCCToken [
	writeOnlyToken := aSmaCCToken
]
