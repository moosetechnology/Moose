Class {
	#name : #DelphiAnonymousProcedureTypeNode,
	#superclass : #DelphiAnonymousMethodTypeNode,
	#instVars : [
		'procedureToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAnonymousProcedureTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousProcedureType: self
]

{ #category : #generated }
DelphiAnonymousProcedureTypeNode >> procedureToken [
	^ procedureToken
]

{ #category : #generated }
DelphiAnonymousProcedureTypeNode >> procedureToken: aSmaCCToken [
	procedureToken := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousProcedureTypeNode >> tokenVariables [
	^ #(#procedureToken #left #right #ofToken #objectToken)
]
