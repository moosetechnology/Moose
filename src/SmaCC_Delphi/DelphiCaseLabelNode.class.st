Class {
	#name : #DelphiCaseLabelNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiCaseLabelNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCaseLabel: self
]

{ #category : #generated }
DelphiCaseLabelNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
DelphiCaseLabelNode >> value [
	^ value
]

{ #category : #generated }
DelphiCaseLabelNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
