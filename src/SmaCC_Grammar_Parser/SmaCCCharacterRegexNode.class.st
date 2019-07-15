Class {
	#name : #SmaCCCharacterRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'char'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCCharacterRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitCharacterRegex: self
]

{ #category : #generated }
SmaCCCharacterRegexNode >> char [
	^ char
]

{ #category : #generated }
SmaCCCharacterRegexNode >> char: aSmaCCToken [
	char := aSmaCCToken
]

{ #category : #generated }
SmaCCCharacterRegexNode >> tokenVariables [
	^ #(#char)
]
