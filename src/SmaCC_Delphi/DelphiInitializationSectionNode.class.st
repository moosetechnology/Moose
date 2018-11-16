Class {
	#name : #DelphiInitializationSectionNode,
	#superclass : #DelphiCodeSectionNode,
	#instVars : [
		'initializationToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInitializationSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInitializationSection: self
]

{ #category : #generated }
DelphiInitializationSectionNode >> initializationToken [
	^ initializationToken
]

{ #category : #generated }
DelphiInitializationSectionNode >> initializationToken: aSmaCCToken [
	initializationToken := aSmaCCToken
]

{ #category : #generated }
DelphiInitializationSectionNode >> tokenVariables [
	^ #(#initializationToken)
]
