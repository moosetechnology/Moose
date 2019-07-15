Class {
	#name : #Antlr4LexerAltNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'lexerElements',
		'lexerCommand'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerAltNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerAlt: self
]

{ #category : #generated }
Antlr4LexerAltNode >> compositeNodeVariables [
	^ #(#lexerElements)
]

{ #category : #'generated-initialize-release' }
Antlr4LexerAltNode >> initialize [
	super initialize.
	lexerElements := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4LexerAltNode >> lexerCommand [
	^ lexerCommand
]

{ #category : #generated }
Antlr4LexerAltNode >> lexerCommand: anAntlr4LexerCommandsNode [
	self lexerCommand notNil
		ifTrue: [ self lexerCommand parent: nil ].
	lexerCommand := anAntlr4LexerCommandsNode.
	self lexerCommand notNil
		ifTrue: [ self lexerCommand parent: self ]
]

{ #category : #generated }
Antlr4LexerAltNode >> lexerElements [
	^ lexerElements
]

{ #category : #generated }
Antlr4LexerAltNode >> lexerElements: anOrderedCollection [
	self setParents: self lexerElements to: nil.
	lexerElements := anOrderedCollection.
	self setParents: self lexerElements to: self
]

{ #category : #generated }
Antlr4LexerAltNode >> nodeVariables [
	^ #(#lexerCommand)
]
