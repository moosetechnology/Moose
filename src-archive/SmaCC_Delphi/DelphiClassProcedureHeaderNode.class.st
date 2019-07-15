Class {
	#name : #DelphiClassProcedureHeaderNode,
	#superclass : #DelphiProcedureHeaderNode,
	#instVars : [
		'classToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassProcedureHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassProcedureHeader: self
]

{ #category : #generated }
DelphiClassProcedureHeaderNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassProcedureHeaderNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassProcedureHeaderNode >> tokenVariables [
	^ #(#classToken #procedureToken #left #right)
]
