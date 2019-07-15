Class {
	#name : #DelphiExternalMethodModifierNode,
	#superclass : #DelphiMethodModifierNode,
	#instVars : [
		'library',
		'nameToken',
		'methodName'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiExternalMethodModifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExternalMethodModifier: self
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> library [
	^ library
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> library: aSmaCCToken [
	library := aSmaCCToken
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> methodName [
	^ methodName
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> methodName: aSmaCCToken [
	methodName := aSmaCCToken
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
DelphiExternalMethodModifierNode >> tokenVariables [
	^ #(#library #nameToken #methodName #modifier)
]
