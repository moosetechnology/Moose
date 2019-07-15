Class {
	#name : #DelphiClassPropertyHeaderNode,
	#superclass : #DelphiPropertyHeaderNode,
	#instVars : [
		'classToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassPropertyHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassPropertyHeader: self
]

{ #category : #generated }
DelphiClassPropertyHeaderNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassPropertyHeaderNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassPropertyHeaderNode >> tokenVariables [
	^ #(#classToken #propertyToken #name #colon)
]
