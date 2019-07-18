Class {
	#name : #SmaCCIdDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'idToken',
		'names'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCIdDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitIdDirective: self
]

{ #category : #generated }
SmaCCIdDirectiveNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
SmaCCIdDirectiveNode >> idToken [
	^ idToken
]

{ #category : #generated }
SmaCCIdDirectiveNode >> idToken: aSmaCCToken [
	idToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SmaCCIdDirectiveNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
]

{ #category : #testing }
SmaCCIdDirectiveNode >> isIdDirective [
	^ true
]

{ #category : #generated }
SmaCCIdDirectiveNode >> names [
	^ names
]

{ #category : #generated }
SmaCCIdDirectiveNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
SmaCCIdDirectiveNode >> tokenVariables [
	^ #(#idToken #directiveStartToken #semicolon)
]
