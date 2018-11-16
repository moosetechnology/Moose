Class {
	#name : #JSXElementNameNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'identifier'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXElementNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXElementName: self
]

{ #category : #generated }
JSXElementNameNode >> identifier [
	^ identifier
]

{ #category : #generated }
JSXElementNameNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
JSXElementNameNode >> tokenVariables [
	^ #(#identifier)
]
