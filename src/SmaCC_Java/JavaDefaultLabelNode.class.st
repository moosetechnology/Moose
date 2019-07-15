Class {
	#name : #JavaDefaultLabelNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'defaultToken',
		'colon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaDefaultLabelNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDefaultLabel: self
]

{ #category : #generated }
JavaDefaultLabelNode >> colon [
	^ colon
]

{ #category : #generated }
JavaDefaultLabelNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaDefaultLabelNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
JavaDefaultLabelNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
JavaDefaultLabelNode >> tokenVariables [
	^ #(#defaultToken #colon)
]
