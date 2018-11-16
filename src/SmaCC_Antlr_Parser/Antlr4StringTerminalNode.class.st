Class {
	#name : #Antlr4StringTerminalNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'value',
		'options'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4StringTerminalNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitStringTerminal: self
]

{ #category : #generated }
Antlr4StringTerminalNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4StringTerminalNode >> options [
	^ options
]

{ #category : #generated }
Antlr4StringTerminalNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4StringTerminalNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
Antlr4StringTerminalNode >> value [
	^ value
]

{ #category : #generated }
Antlr4StringTerminalNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
