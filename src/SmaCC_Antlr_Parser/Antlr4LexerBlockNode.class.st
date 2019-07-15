Class {
	#name : #Antlr4LexerBlockNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'leftParen',
		'lexerExpressions',
		'bars',
		'rightParen'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerBlockNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerBlock: self
]

{ #category : #generated }
Antlr4LexerBlockNode >> bars [
	^ bars
]

{ #category : #generated }
Antlr4LexerBlockNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
Antlr4LexerBlockNode >> compositeNodeVariables [
	^ #(#lexerExpressions)
]

{ #category : #generated }
Antlr4LexerBlockNode >> compositeTokenVariables [
	^ #(#bars)
]

{ #category : #'generated-initialize-release' }
Antlr4LexerBlockNode >> initialize [
	super initialize.
	lexerExpressions := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4LexerBlockNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
Antlr4LexerBlockNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerBlockNode >> lexerExpressions [
	^ lexerExpressions
]

{ #category : #generated }
Antlr4LexerBlockNode >> lexerExpressions: anOrderedCollection [
	self setParents: self lexerExpressions to: nil.
	lexerExpressions := anOrderedCollection.
	self setParents: self lexerExpressions to: self
]

{ #category : #generated }
Antlr4LexerBlockNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
Antlr4LexerBlockNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerBlockNode >> tokenVariables [
	^ #(#leftParen #rightParen)
]
