Class {
	#name : #DelphiOldClassTypeNode,
	#superclass : #DelphiClassTypeNode,
	#instVars : [
		'objectToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiOldClassTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitOldClassType: self
]

{ #category : #generated }
DelphiOldClassTypeNode >> objectToken [
	^ objectToken
]

{ #category : #generated }
DelphiOldClassTypeNode >> objectToken: aSmaCCToken [
	objectToken := aSmaCCToken
]

{ #category : #generated }
DelphiOldClassTypeNode >> tokenVariables [
	^ #(#objectToken #left #right #endToken)
]
