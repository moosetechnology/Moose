Class {
	#name : #Antlr4LexerCommandsNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'arrow',
		'commands',
		'commas'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerCommandsNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerCommands: self
]

{ #category : #generated }
Antlr4LexerCommandsNode >> arrow [
	^ arrow
]

{ #category : #generated }
Antlr4LexerCommandsNode >> arrow: aSmaCCToken [
	arrow := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCommandsNode >> commands [
	^ commands
]

{ #category : #generated }
Antlr4LexerCommandsNode >> commands: anOrderedCollection [
	self setParents: self commands to: nil.
	commands := anOrderedCollection.
	self setParents: self commands to: self
]

{ #category : #generated }
Antlr4LexerCommandsNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4LexerCommandsNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4LexerCommandsNode >> compositeNodeVariables [
	^ #(#commands)
]

{ #category : #generated }
Antlr4LexerCommandsNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
Antlr4LexerCommandsNode >> initialize [
	super initialize.
	commands := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4LexerCommandsNode >> tokenVariables [
	^ #(#arrow)
]
