Class {
	#name : #CSThisAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'thisToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSThisAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitThisAccess: self
]

{ #category : #generated }
CSThisAccessNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
CSThisAccessNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
CSThisAccessNode >> tokenVariables [
	^ #(#thisToken)
]
