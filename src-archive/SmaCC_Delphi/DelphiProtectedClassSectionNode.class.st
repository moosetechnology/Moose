Class {
	#name : #DelphiProtectedClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#instVars : [
		'strictToken',
		'protectedToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProtectedClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProtectedClassSection: self
]

{ #category : #generated }
DelphiProtectedClassSectionNode >> protectedToken [
	^ protectedToken
]

{ #category : #generated }
DelphiProtectedClassSectionNode >> protectedToken: aSmaCCToken [
	protectedToken := aSmaCCToken
]

{ #category : #generated }
DelphiProtectedClassSectionNode >> strictToken [
	^ strictToken
]

{ #category : #generated }
DelphiProtectedClassSectionNode >> strictToken: aSmaCCToken [
	strictToken := aSmaCCToken
]

{ #category : #generated }
DelphiProtectedClassSectionNode >> tokenVariables [
	^ #(#strictToken #protectedToken)
]
