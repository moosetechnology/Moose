Class {
	#name : #Antlr4ReferenceTerminalNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'options'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ReferenceTerminalNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitReferenceTerminal: self
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> options [
	^ options
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4ReferenceTerminalNode >> tokenVariables [
	^ #(#nameToken)
]
