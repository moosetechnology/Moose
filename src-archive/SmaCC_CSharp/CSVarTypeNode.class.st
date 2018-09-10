Class {
	#name : #CSVarTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'varToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSVarTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVarType: self
]

{ #category : #generated }
CSVarTypeNode >> tokenVariables [
	^ #(#varToken)
]

{ #category : #generated }
CSVarTypeNode >> varToken [
	^ varToken
]

{ #category : #generated }
CSVarTypeNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]
