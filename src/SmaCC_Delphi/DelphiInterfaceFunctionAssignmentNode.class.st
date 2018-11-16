Class {
	#name : #DelphiInterfaceFunctionAssignmentNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'function',
		'qualifiedName',
		'equalToken',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceFunctionAssignment: self
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> function [
	^ function
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> function: aSmaCCToken [
	function := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> name [
	^ name
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> nodeVariables [
	^ #(#qualifiedName)
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> qualifiedName [
	^ qualifiedName
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> qualifiedName: aDelphiQualifiedNameNode [
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: nil ].
	qualifiedName := aDelphiQualifiedNameNode.
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: self ]
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceFunctionAssignmentNode >> tokenVariables [
	^ #(#function #equalToken #name)
]
