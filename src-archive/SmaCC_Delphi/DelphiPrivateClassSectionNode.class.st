Class {
	#name : #DelphiPrivateClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#instVars : [
		'strictToken',
		'privateToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPrivateClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPrivateClassSection: self
]

{ #category : #generated }
DelphiPrivateClassSectionNode >> privateToken [
	^ privateToken
]

{ #category : #generated }
DelphiPrivateClassSectionNode >> privateToken: aSmaCCToken [
	privateToken := aSmaCCToken
]

{ #category : #generated }
DelphiPrivateClassSectionNode >> strictToken [
	^ strictToken
]

{ #category : #generated }
DelphiPrivateClassSectionNode >> strictToken: aSmaCCToken [
	strictToken := aSmaCCToken
]

{ #category : #generated }
DelphiPrivateClassSectionNode >> tokenVariables [
	^ #(#strictToken #privateToken)
]
