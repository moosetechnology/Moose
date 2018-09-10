Class {
	#name : #DelphiGotoStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'gotoToken',
		'label'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiGotoStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGotoStatement: self
]

{ #category : #generated }
DelphiGotoStatementNode >> gotoToken [
	^ gotoToken
]

{ #category : #generated }
DelphiGotoStatementNode >> gotoToken: aSmaCCToken [
	gotoToken := aSmaCCToken
]

{ #category : #generated }
DelphiGotoStatementNode >> label [
	^ label
]

{ #category : #generated }
DelphiGotoStatementNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
DelphiGotoStatementNode >> tokenVariables [
	^ #(#gotoToken #label)
]
