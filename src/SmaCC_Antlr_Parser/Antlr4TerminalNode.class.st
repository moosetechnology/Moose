Class {
	#name : #Antlr4TerminalNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'options',
		'value'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4TerminalNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitTerminal: self
]

{ #category : #generated }
Antlr4TerminalNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4TerminalNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4TerminalNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4TerminalNode >> options [
	^ options
]

{ #category : #generated }
Antlr4TerminalNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4TerminalNode >> tokenVariables [
	^ #(#nameToken #value)
]

{ #category : #generated }
Antlr4TerminalNode >> value [
	^ value
]

{ #category : #generated }
Antlr4TerminalNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
