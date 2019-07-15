Class {
	#name : #JSDebuggerStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'debuggerToken',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSDebuggerStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDebuggerStatement: self
]

{ #category : #generated }
JSDebuggerStatementNode >> debuggerToken [
	^ debuggerToken
]

{ #category : #generated }
JSDebuggerStatementNode >> debuggerToken: aSmaCCToken [
	debuggerToken := aSmaCCToken
]

{ #category : #generated }
JSDebuggerStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSDebuggerStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSDebuggerStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSDebuggerStatementNode >> tokenVariables [
	^ #(#debuggerToken)
]
