Class {
	#name : #DelphiAnonymousFunctionTypeNode,
	#superclass : #DelphiAnonymousMethodTypeNode,
	#instVars : [
		'functionToken',
		'colon',
		'type'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousFunctionType: self
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> functionToken [
	^ functionToken
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> functionToken: aSmaCCToken [
	functionToken := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> tokenVariables [
	^ #(#functionToken #colon #left #right #ofToken #objectToken)
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiAnonymousFunctionTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
