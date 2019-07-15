Class {
	#name : #CSUsingStaticDirectiveNode,
	#superclass : #CSUsingDirectiveNode,
	#instVars : [
		'staticToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUsingStaticDirectiveNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUsingStaticDirective: self
]

{ #category : #generated }
CSUsingStaticDirectiveNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
CSUsingStaticDirectiveNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
CSUsingStaticDirectiveNode >> tokenVariables [
	^ #(#staticToken #usingToken)
]
