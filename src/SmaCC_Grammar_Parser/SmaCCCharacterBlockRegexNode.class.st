Class {
	#name : #SmaCCCharacterBlockRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'block'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCCharacterBlockRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitCharacterBlockRegex: self
]

{ #category : #generated }
SmaCCCharacterBlockRegexNode >> block [
	^ block
]

{ #category : #generated }
SmaCCCharacterBlockRegexNode >> block: aSmaCCToken [
	block := aSmaCCToken
]

{ #category : #generated }
SmaCCCharacterBlockRegexNode >> tokenVariables [
	^ #(#block)
]
