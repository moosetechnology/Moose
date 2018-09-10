Class {
	#name : #DelphiAssignmentExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'lhs',
		'assignment',
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAssignmentExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssignmentExpression: self
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> assignment [
	^ assignment
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> assignment: aSmaCCToken [
	assignment := aSmaCCToken
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> lhs [
	^ lhs
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> lhs: aDelphiExpressionNode [
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aDelphiExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> nodeVariables [
	^ #(#lhs #value)
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> tokenVariables [
	^ #(#assignment)
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> value [
	^ value
]

{ #category : #generated }
DelphiAssignmentExpressionNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
