Class {
	#name : #DelphiPropertyStoredNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'storedToken',
		'isStored'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyStoredNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyStored: self
]

{ #category : #generated }
DelphiPropertyStoredNode >> isStored [
	^ isStored
]

{ #category : #generated }
DelphiPropertyStoredNode >> isStored: aSmaCCToken [
	isStored := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyStoredNode >> storedToken [
	^ storedToken
]

{ #category : #generated }
DelphiPropertyStoredNode >> storedToken: aSmaCCToken [
	storedToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyStoredNode >> tokenVariables [
	^ #(#storedToken #isStored)
]
