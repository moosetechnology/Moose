Class {
	#name : #DelphiLabelVariableNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'labelToken',
		'names',
		'commas',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiLabelVariableNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLabelVariable: self
]

{ #category : #generated }
DelphiLabelVariableNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiLabelVariableNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiLabelVariableNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiLabelVariableNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiLabelVariableNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiLabelVariableNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiLabelVariableNode >> labelToken [
	^ labelToken
]

{ #category : #generated }
DelphiLabelVariableNode >> labelToken: aSmaCCToken [
	labelToken := aSmaCCToken
]

{ #category : #generated }
DelphiLabelVariableNode >> names [
	^ names
]

{ #category : #generated }
DelphiLabelVariableNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiLabelVariableNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiLabelVariableNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiLabelVariableNode >> tokenVariables [
	^ #(#labelToken)
]
