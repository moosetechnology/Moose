Class {
	#name : #SmaCCTokenRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCTokenRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitTokenRegex: self
]

{ #category : #generated }
SmaCCTokenRegexNode >> name [
	^ name
]

{ #category : #generated }
SmaCCTokenRegexNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCTokenRegexNode >> tokenVariables [
	^ #(#name)
]
