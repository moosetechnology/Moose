Class {
	#name : #DelphiGuidNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'left',
		'string',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiGuidNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGuid: self
]

{ #category : #generated }
DelphiGuidNode >> left [
	^ left
]

{ #category : #generated }
DelphiGuidNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiGuidNode >> nodeVariables [
	^ #(#string)
]

{ #category : #generated }
DelphiGuidNode >> right [
	^ right
]

{ #category : #generated }
DelphiGuidNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiGuidNode >> string [
	^ string
]

{ #category : #generated }
DelphiGuidNode >> string: aDelphiExpressionNode [
	self string notNil
		ifTrue: [ self string parent: nil ].
	string := aDelphiExpressionNode.
	self string notNil
		ifTrue: [ self string parent: self ]
]

{ #category : #generated }
DelphiGuidNode >> tokenVariables [
	^ #(#left #right)
]
