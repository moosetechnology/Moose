Class {
	#name : #DelphiPointerTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'upArrowToken',
		'type'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPointerTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPointerType: self
]

{ #category : #generated }
DelphiPointerTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiPointerTypeNode >> tokenVariables [
	^ #(#upArrowToken)
]

{ #category : #generated }
DelphiPointerTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiPointerTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiPointerTypeNode >> upArrowToken [
	^ upArrowToken
]

{ #category : #generated }
DelphiPointerTypeNode >> upArrowToken: aSmaCCToken [
	upArrowToken := aSmaCCToken
]
