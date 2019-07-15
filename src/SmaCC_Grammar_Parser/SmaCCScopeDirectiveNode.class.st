Class {
	#name : #SmaCCScopeDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'typeToken',
		'names'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCScopeDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitScopeDirective: self
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #'generated-initialize-release' }
SmaCCScopeDirectiveNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> names [
	^ names
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> tokenVariables [
	^ #(#typeToken #directiveStartToken #semicolon)
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
SmaCCScopeDirectiveNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
