Class {
	#name : #Antlr4SetElementNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'options',
		'value'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4SetElementNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitSetElement: self
]

{ #category : #generated }
Antlr4SetElementNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4SetElementNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4SetElementNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4SetElementNode >> options [
	^ options
]

{ #category : #generated }
Antlr4SetElementNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4SetElementNode >> tokenVariables [
	^ #(#nameToken #value)
]

{ #category : #generated }
Antlr4SetElementNode >> value [
	^ value
]

{ #category : #generated }
Antlr4SetElementNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
