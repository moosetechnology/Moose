Class {
	#name : #SmaCCDirectiveNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'directiveStartToken',
		'semicolon'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitDirective: self
]

{ #category : #generated }
SmaCCDirectiveNode >> directiveStartToken [
	^ directiveStartToken
]

{ #category : #generated }
SmaCCDirectiveNode >> directiveStartToken: aSmaCCToken [
	directiveStartToken := aSmaCCToken
]

{ #category : #generated }
SmaCCDirectiveNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
SmaCCDirectiveNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
SmaCCDirectiveNode >> tokenVariables [
	^ #(#directiveStartToken #semicolon)
]
