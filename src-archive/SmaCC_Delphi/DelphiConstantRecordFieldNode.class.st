Class {
	#name : #DelphiConstantRecordFieldNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'name',
		'colon',
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstantRecordFieldNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantRecordField: self
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> name [
	^ name
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiConstantRecordFieldNode >> tokenVariables [
	^ #(#name #colon)
]
