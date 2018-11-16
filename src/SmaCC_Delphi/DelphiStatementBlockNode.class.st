Class {
	#name : #DelphiStatementBlockNode,
	#superclass : #DelphiMultiStatementNode,
	#instVars : [
		'beginToken',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiStatementBlockNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatementBlock: self
]

{ #category : #generated }
DelphiStatementBlockNode >> beginToken [
	^ beginToken
]

{ #category : #generated }
DelphiStatementBlockNode >> beginToken: aSmaCCToken [
	beginToken := aSmaCCToken
]

{ #category : #generated }
DelphiStatementBlockNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiStatementBlockNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiStatementBlockNode >> tokenVariables [
	^ #(#beginToken #endToken)
]
