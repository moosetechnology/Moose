Class {
	#name : #SmaCCIgnoreVariableDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'ignoreVariablesToken',
		'names'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitIgnoreVariableDirective: self
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> ignoreVariablesToken [
	^ ignoreVariablesToken
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> ignoreVariablesToken: aSmaCCToken [
	ignoreVariablesToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SmaCCIgnoreVariableDirectiveNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
]

{ #category : #testing }
SmaCCIgnoreVariableDirectiveNode >> isIgnoreDirective [
	^ true
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> names [
	^ names
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
SmaCCIgnoreVariableDirectiveNode >> tokenVariables [
	^ #(#ignoreVariablesToken #directiveStartToken #semicolon)
]
