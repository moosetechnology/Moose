Class {
	#name : #DelphiAsmBlockNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'asmToken',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAsmBlockNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAsmBlock: self
]

{ #category : #generated }
DelphiAsmBlockNode >> asmToken [
	^ asmToken
]

{ #category : #generated }
DelphiAsmBlockNode >> asmToken: aSmaCCToken [
	asmToken := aSmaCCToken
]

{ #category : #generated }
DelphiAsmBlockNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiAsmBlockNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiAsmBlockNode >> tokenVariables [
	^ #(#asmToken #endToken)
]
