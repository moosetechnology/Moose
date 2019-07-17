Class {
	#name : #SmaCCNodeNameDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'typeToken',
		'name'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitNodeNameDirective: self
]

{ #category : #testing }
SmaCCNodeNameDirectiveNode >> isNameDirective [
	^ true
]

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> name [
	^ name
]

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> tokenVariables [
	^ #(#typeToken #name #directiveStartToken #semicolon)
]

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
SmaCCNodeNameDirectiveNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
