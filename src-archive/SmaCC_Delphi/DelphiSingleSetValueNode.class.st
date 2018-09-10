Class {
	#name : #DelphiSingleSetValueNode,
	#superclass : #DelphiSetValueNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiSingleSetValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSingleSetValue: self
]

{ #category : #generated }
DelphiSingleSetValueNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
DelphiSingleSetValueNode >> value [
	^ value
]

{ #category : #generated }
DelphiSingleSetValueNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
