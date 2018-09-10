Class {
	#name : #DelphiPropertyModifierNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'defaultToken',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyModifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyModifier: self
]

{ #category : #generated }
DelphiPropertyModifierNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
DelphiPropertyModifierNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyModifierNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiPropertyModifierNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiPropertyModifierNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyModifierNode >> tokenVariables [
	^ #(#defaultToken)
]
