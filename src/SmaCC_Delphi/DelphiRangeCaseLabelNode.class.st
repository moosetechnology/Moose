Class {
	#name : #DelphiRangeCaseLabelNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'fromValue',
		'dots',
		'toValue'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRangeCaseLabelNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRangeCaseLabel: self
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> dots [
	^ dots
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> dots: aSmaCCToken [
	dots := aSmaCCToken
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> fromValue [
	^ fromValue
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> fromValue: aDelphiExpressionNode [
	self fromValue notNil
		ifTrue: [ self fromValue parent: nil ].
	fromValue := aDelphiExpressionNode.
	self fromValue notNil
		ifTrue: [ self fromValue parent: self ]
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> nodeVariables [
	^ #(#fromValue #toValue)
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> toValue [
	^ toValue
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> toValue: aDelphiExpressionNode [
	self toValue notNil
		ifTrue: [ self toValue parent: nil ].
	toValue := aDelphiExpressionNode.
	self toValue notNil
		ifTrue: [ self toValue parent: self ]
]

{ #category : #generated }
DelphiRangeCaseLabelNode >> tokenVariables [
	^ #(#dots)
]
