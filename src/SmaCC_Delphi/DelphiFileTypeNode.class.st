Class {
	#name : #DelphiFileTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'fileToken',
		'ofToken',
		'type'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFileTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFileType: self
]

{ #category : #generated }
DelphiFileTypeNode >> fileToken [
	^ fileToken
]

{ #category : #generated }
DelphiFileTypeNode >> fileToken: aSmaCCToken [
	fileToken := aSmaCCToken
]

{ #category : #generated }
DelphiFileTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiFileTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiFileTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiFileTypeNode >> tokenVariables [
	^ #(#fileToken #ofToken)
]

{ #category : #generated }
DelphiFileTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiFileTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
