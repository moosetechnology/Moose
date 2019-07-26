Class {
	#name : #SmaCCFlagDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'typeToken'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCFlagDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitFlagDirective: self
]

{ #category : #testing }
SmaCCFlagDirectiveNode >> isFlagDirective [
	^ true
]

{ #category : #generated }
SmaCCFlagDirectiveNode >> tokenVariables [
	^ #(#typeToken #directiveStartToken #semicolon)
]

{ #category : #generated }
SmaCCFlagDirectiveNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
SmaCCFlagDirectiveNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
