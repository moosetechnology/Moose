Class {
	#name : #Antlr4LexerCharSetNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'leftBracket',
		'charSet',
		'rightBracket'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerCharSetNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerCharSet: self
]

{ #category : #generated }
Antlr4LexerCharSetNode >> charSet [
	^ charSet
]

{ #category : #generated }
Antlr4LexerCharSetNode >> charSet: aSmaCCToken [
	charSet := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCharSetNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
Antlr4LexerCharSetNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCharSetNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
Antlr4LexerCharSetNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerCharSetNode >> tokenVariables [
	^ #(#leftBracket #charSet #rightBracket)
]
