Class {
	#name : #DelphiSetTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'setToken',
		'ofToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiSetTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetType: self
]

{ #category : #generated }
DelphiSetTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiSetTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiSetTypeNode >> setToken [
	^ setToken
]

{ #category : #generated }
DelphiSetTypeNode >> setToken: aSmaCCToken [
	setToken := aSmaCCToken
]

{ #category : #generated }
DelphiSetTypeNode >> tokenVariables [
	^ #(#setToken #ofToken)
]
