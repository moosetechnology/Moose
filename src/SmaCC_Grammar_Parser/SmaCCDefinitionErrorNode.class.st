Class {
	#name : #SmaCCDefinitionErrorNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'smaccError',
		'semicolon'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCDefinitionErrorNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitDefinitionError: self
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> nodeVariables [
	^ #(#smaccError)
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> smaccError [
	^ smaccError
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> smaccError: aSmaCCErrorNode [
	self smaccError notNil
		ifTrue: [ self smaccError parent: nil ].
	smaccError := aSmaCCErrorNode.
	self smaccError notNil
		ifTrue: [ self smaccError parent: self ]
]

{ #category : #generated }
SmaCCDefinitionErrorNode >> tokenVariables [
	^ #(#semicolon)
]
