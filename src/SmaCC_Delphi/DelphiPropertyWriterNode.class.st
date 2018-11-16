Class {
	#name : #DelphiPropertyWriterNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'writeToken',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyWriterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyWriter: self
]

{ #category : #generated }
DelphiPropertyWriterNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPropertyWriterNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPropertyWriterNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPropertyWriterNode >> tokenVariables [
	^ #(#writeToken)
]

{ #category : #generated }
DelphiPropertyWriterNode >> writeToken [
	^ writeToken
]

{ #category : #generated }
DelphiPropertyWriterNode >> writeToken: aSmaCCToken [
	writeToken := aSmaCCToken
]
