Class {
	#name : #DelphiClassFunctionHeaderNode,
	#superclass : #DelphiFunctionHeaderNode,
	#instVars : [
		'classToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassFunctionHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassFunctionHeader: self
]

{ #category : #generated }
DelphiClassFunctionHeaderNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassFunctionHeaderNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassFunctionHeaderNode >> tokenVariables [
	^ #(#classToken #functionToken #colon #left #right)
]
