Class {
	#name : #DelphiCaseOptionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'label',
		'colon',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiCaseOptionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCaseOption: self
]

{ #category : #generated }
DelphiCaseOptionNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiCaseOptionNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiCaseOptionNode >> label [
	^ label
]

{ #category : #generated }
DelphiCaseOptionNode >> label: aDelphiProgramNode [
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aDelphiProgramNode.
	self label notNil
		ifTrue: [ self label parent: self ]
]

{ #category : #generated }
DelphiCaseOptionNode >> nodeVariables [
	^ #(#label #statement)
]

{ #category : #generated }
DelphiCaseOptionNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiCaseOptionNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiCaseOptionNode >> tokenVariables [
	^ #(#colon)
]
