Class {
	#name : #SmaCCAttributeDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'attributesToken',
		'classname',
		'leftParen',
		'names',
		'rightParen'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCAttributeDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitAttributeDirective: self
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> attributesToken [
	^ attributesToken
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> attributesToken: aSmaCCToken [
	attributesToken := aSmaCCToken
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> classname [
	^ classname
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> classname: aSmaCCToken [
	classname := aSmaCCToken
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #'generated-initialize-release' }
SmaCCAttributeDirectiveNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> names [
	^ names
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
SmaCCAttributeDirectiveNode >> tokenVariables [
	^ #(#attributesToken #classname #leftParen #rightParen #directiveStartToken #semicolon)
]
