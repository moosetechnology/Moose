Class {
	#name : #Antlr4TokensSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'tokensToken',
		'leftBrace',
		'nameTokens',
		'commas',
		'rightBrace'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4TokensSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitTokensSpec: self
]

{ #category : #generated }
Antlr4TokensSpecNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4TokensSpecNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4TokensSpecNode >> compositeTokenVariables [
	^ #(#nameTokens #commas)
]

{ #category : #'generated-initialize-release' }
Antlr4TokensSpecNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4TokensSpecNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
Antlr4TokensSpecNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4TokensSpecNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4TokensSpecNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4TokensSpecNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
Antlr4TokensSpecNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4TokensSpecNode >> tokenVariables [
	^ #(#tokensToken #leftBrace #rightBrace)
]

{ #category : #generated }
Antlr4TokensSpecNode >> tokensToken [
	^ tokensToken
]

{ #category : #generated }
Antlr4TokensSpecNode >> tokensToken: aSmaCCToken [
	tokensToken := aSmaCCToken
]
