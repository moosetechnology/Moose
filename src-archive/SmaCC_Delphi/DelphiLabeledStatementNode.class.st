Class {
	#name : #DelphiLabeledStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'label',
		'colon',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiLabeledStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLabeledStatement: self
]

{ #category : #generated }
DelphiLabeledStatementNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiLabeledStatementNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiLabeledStatementNode >> label [
	^ label
]

{ #category : #generated }
DelphiLabeledStatementNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
DelphiLabeledStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
DelphiLabeledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiLabeledStatementNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiLabeledStatementNode >> tokenVariables [
	^ #(#label #colon)
]
