Class {
	#name : #DelphiRangeTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'startValue',
		'dots',
		'endValue'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRangeTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRangeType: self
]

{ #category : #generated }
DelphiRangeTypeNode >> dots [
	^ dots
]

{ #category : #generated }
DelphiRangeTypeNode >> dots: aSmaCCToken [
	dots := aSmaCCToken
]

{ #category : #generated }
DelphiRangeTypeNode >> endValue [
	^ endValue
]

{ #category : #generated }
DelphiRangeTypeNode >> endValue: aDelphiExpressionNode [
	self endValue notNil
		ifTrue: [ self endValue parent: nil ].
	endValue := aDelphiExpressionNode.
	self endValue notNil
		ifTrue: [ self endValue parent: self ]
]

{ #category : #generated }
DelphiRangeTypeNode >> nodeVariables [
	^ #(#startValue #endValue)
]

{ #category : #generated }
DelphiRangeTypeNode >> startValue [
	^ startValue
]

{ #category : #generated }
DelphiRangeTypeNode >> startValue: aDelphiExpressionNode [
	self startValue notNil
		ifTrue: [ self startValue parent: nil ].
	startValue := aDelphiExpressionNode.
	self startValue notNil
		ifTrue: [ self startValue parent: self ]
]

{ #category : #generated }
DelphiRangeTypeNode >> tokenVariables [
	^ #(#dots)
]
