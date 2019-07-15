Class {
	#name : #DelphiImplementationCodeNode,
	#superclass : #DelphiCodeSectionNode,
	#instVars : [
		'beginToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiImplementationCodeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImplementationCode: self
]

{ #category : #generated }
DelphiImplementationCodeNode >> beginToken [
	^ beginToken
]

{ #category : #generated }
DelphiImplementationCodeNode >> beginToken: aSmaCCToken [
	beginToken := aSmaCCToken
]

{ #category : #generated }
DelphiImplementationCodeNode >> tokenVariables [
	^ #(#beginToken)
]
