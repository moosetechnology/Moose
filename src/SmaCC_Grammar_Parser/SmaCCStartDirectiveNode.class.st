Class {
	#name : #SmaCCStartDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'startToken',
		'symbols'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCStartDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitStartDirective: self
]

{ #category : #generated }
SmaCCStartDirectiveNode >> compositeTokenVariables [
	^ #(#symbols)
]

{ #category : #'generated-initialize-release' }
SmaCCStartDirectiveNode >> initialize [
	super initialize.
	symbols := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCStartDirectiveNode >> startToken [
	^ startToken
]

{ #category : #generated }
SmaCCStartDirectiveNode >> startToken: aSmaCCToken [
	startToken := aSmaCCToken
]

{ #category : #generated }
SmaCCStartDirectiveNode >> symbols [
	^ symbols
]

{ #category : #generated }
SmaCCStartDirectiveNode >> symbols: anOrderedCollection [
	symbols := anOrderedCollection
]

{ #category : #generated }
SmaCCStartDirectiveNode >> tokenVariables [
	^ #(#startToken #directiveStartToken #semicolon)
]
