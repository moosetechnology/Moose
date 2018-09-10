Class {
	#name : #JSGeneratorFunctionNode,
	#superclass : #JSFunctionNode,
	#instVars : [
		'star'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSGeneratorFunctionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGeneratorFunction: self
]

{ #category : #generated }
JSGeneratorFunctionNode >> star [
	^ star
]

{ #category : #generated }
JSGeneratorFunctionNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JSGeneratorFunctionNode >> tokenVariables [
	^ #(#star #functionToken)
]
