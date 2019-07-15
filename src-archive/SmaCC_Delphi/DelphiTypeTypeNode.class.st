Class {
	#name : #DelphiTypeTypeNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'typeToken',
		'typeName'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiTypeTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeType: self
]

{ #category : #generated }
DelphiTypeTypeNode >> nodeVariables [
	^ #(#typeName)
]

{ #category : #generated }
DelphiTypeTypeNode >> tokenVariables [
	^ #(#typeToken)
]

{ #category : #generated }
DelphiTypeTypeNode >> typeName [
	^ typeName
]

{ #category : #generated }
DelphiTypeTypeNode >> typeName: aDelphiQualifiedNameNode [
	self typeName notNil
		ifTrue: [ self typeName parent: nil ].
	typeName := aDelphiQualifiedNameNode.
	self typeName notNil
		ifTrue: [ self typeName parent: self ]
]

{ #category : #generated }
DelphiTypeTypeNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
DelphiTypeTypeNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
