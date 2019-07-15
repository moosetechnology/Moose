Class {
	#name : #DelphiClassVarsNode,
	#superclass : #DelphiVarsNode,
	#instVars : [
		'classToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassVarsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassVars: self
]

{ #category : #generated }
DelphiClassVarsNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassVarsNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassVarsNode >> tokenVariables [
	^ #(#classToken #varToken)
]
