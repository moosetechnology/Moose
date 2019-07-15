Class {
	#name : #DelphiInterfaceProcedureAssignmentNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'procedureToken',
		'qualifiedName',
		'equalToken',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceProcedureAssignment: self
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> name [
	^ name
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> nodeVariables [
	^ #(#qualifiedName)
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> procedureToken [
	^ procedureToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> procedureToken: aSmaCCToken [
	procedureToken := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> qualifiedName [
	^ qualifiedName
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> qualifiedName: aDelphiQualifiedNameNode [
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: nil ].
	qualifiedName := aDelphiQualifiedNameNode.
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: self ]
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceProcedureAssignmentNode >> tokenVariables [
	^ #(#procedureToken #equalToken #name)
]
