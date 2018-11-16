Class {
	#name : #JSGeneratorMethodDefinitionNode,
	#superclass : #JSMethodDefinitionNode,
	#instVars : [
		'star'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSGeneratorMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGeneratorMethodDefinition: self
]

{ #category : #generated }
JSGeneratorMethodDefinitionNode >> star [
	^ star
]

{ #category : #generated }
JSGeneratorMethodDefinitionNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JSGeneratorMethodDefinitionNode >> tokenVariables [
	^ #(#star)
]
