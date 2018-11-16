Class {
	#name : #Antlr4LexerCommandNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameTokens',
		'modeToken',
		'leftParen',
		'value',
		'rightParen'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerCommandNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerCommand: self
]

{ #category : #generated }
Antlr4LexerCommandNode >> compositeTokenVariables [
	^ #(#nameTokens)
]

{ #category : #'generated-initialize-release' }
Antlr4LexerCommandNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4LexerCommandNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
Antlr4LexerCommandNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCommandNode >> modeToken [
	^ modeToken
]

{ #category : #generated }
Antlr4LexerCommandNode >> modeToken: aSmaCCToken [
	modeToken := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCommandNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4LexerCommandNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4LexerCommandNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
Antlr4LexerCommandNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCommandNode >> tokenVariables [
	^ #(#modeToken #leftParen #value #rightParen)
]

{ #category : #generated }
Antlr4LexerCommandNode >> value [
	^ value
]

{ #category : #generated }
Antlr4LexerCommandNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
