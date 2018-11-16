Class {
	#name : #SmaCCSuperclassDirectiveNode,
	#superclass : #SmaCCDirectiveNode,
	#instVars : [
		'hierarchyToken',
		'superclass',
		'leftParen',
		'names',
		'rightParen'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitSuperclassDirective: self
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> hierarchyToken [
	^ hierarchyToken
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> hierarchyToken: aSmaCCToken [
	hierarchyToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
SmaCCSuperclassDirectiveNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> names [
	^ names
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> superclass [
	^ superclass
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> superclass: aSmaCCToken [
	superclass := aSmaCCToken
]

{ #category : #generated }
SmaCCSuperclassDirectiveNode >> tokenVariables [
	^ #(#hierarchyToken #superclass #leftParen #rightParen #directiveStartToken #semicolon)
]
