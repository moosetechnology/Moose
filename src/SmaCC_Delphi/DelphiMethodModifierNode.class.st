Class {
	#name : #DelphiMethodModifierNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'modifier',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMethodModifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodModifier: self
]

{ #category : #generated }
DelphiMethodModifierNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiMethodModifierNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiMethodModifierNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiMethodModifierNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiMethodModifierNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiMethodModifierNode >> tokenVariables [
	^ #(#modifier)
]
