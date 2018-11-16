Class {
	#name : #DelphiAbsoluteTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'type',
		'absoluteToken',
		'variable'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAbsoluteTypeNode >> absoluteToken [
	^ absoluteToken
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> absoluteToken: aSmaCCToken [
	absoluteToken := aSmaCCToken
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAbsoluteType: self
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> nodeVariables [
	^ #(#type #variable)
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> tokenVariables [
	^ #(#absoluteToken)
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> variable [
	^ variable
]

{ #category : #generated }
DelphiAbsoluteTypeNode >> variable: aDelphiProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aDelphiProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
