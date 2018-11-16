Class {
	#name : #CSConstructorConstraintNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'newToken',
		'leftParenToken',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstructorConstraintNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorConstraint: self
]

{ #category : #generated }
CSConstructorConstraintNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSConstructorConstraintNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorConstraintNode >> newToken [
	^ newToken
]

{ #category : #generated }
CSConstructorConstraintNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorConstraintNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSConstructorConstraintNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorConstraintNode >> tokenVariables [
	^ #(#newToken #leftParenToken #rightParenToken)
]
