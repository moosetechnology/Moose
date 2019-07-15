Class {
	#name : #DelphiRangeSetValueNode,
	#superclass : #DelphiSetValueNode,
	#instVars : [
		'fromValue',
		'dots',
		'toValue'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRangeSetValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRangeSetValue: self
]

{ #category : #generated }
DelphiRangeSetValueNode >> dots [
	^ dots
]

{ #category : #generated }
DelphiRangeSetValueNode >> dots: aSmaCCToken [
	dots := aSmaCCToken
]

{ #category : #generated }
DelphiRangeSetValueNode >> fromValue [
	^ fromValue
]

{ #category : #generated }
DelphiRangeSetValueNode >> fromValue: aDelphiExpressionNode [
	self fromValue notNil
		ifTrue: [ self fromValue parent: nil ].
	fromValue := aDelphiExpressionNode.
	self fromValue notNil
		ifTrue: [ self fromValue parent: self ]
]

{ #category : #generated }
DelphiRangeSetValueNode >> nodeVariables [
	^ #(#fromValue #toValue)
]

{ #category : #generated }
DelphiRangeSetValueNode >> toValue [
	^ toValue
]

{ #category : #generated }
DelphiRangeSetValueNode >> toValue: aDelphiExpressionNode [
	self toValue notNil
		ifTrue: [ self toValue parent: nil ].
	toValue := aDelphiExpressionNode.
	self toValue notNil
		ifTrue: [ self toValue parent: self ]
]

{ #category : #generated }
DelphiRangeSetValueNode >> tokenVariables [
	^ #(#dots)
]
