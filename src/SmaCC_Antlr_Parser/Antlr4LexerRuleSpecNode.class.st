Class {
	#name : #Antlr4LexerRuleSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'modifier',
		'nameToken',
		'colon',
		'lexerExpressions',
		'bars',
		'semicolon'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerRuleSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerRuleSpec: self
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> bars [
	^ bars
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> colon [
	^ colon
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> compositeNodeVariables [
	^ #(#lexerExpressions)
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> compositeTokenVariables [
	^ #(#bars)
]

{ #category : #'generated-initialize-release' }
Antlr4LexerRuleSpecNode >> initialize [
	super initialize.
	lexerExpressions := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> lexerExpressions [
	^ lexerExpressions
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> lexerExpressions: anOrderedCollection [
	self setParents: self lexerExpressions to: nil.
	lexerExpressions := anOrderedCollection.
	self setParents: self lexerExpressions to: self
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> modifier [
	^ modifier
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerRuleSpecNode >> tokenVariables [
	^ #(#nameToken #colon #semicolon #modifier)
]
