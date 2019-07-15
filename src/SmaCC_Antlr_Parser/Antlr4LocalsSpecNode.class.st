Class {
	#name : #Antlr4LocalsSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'localsToken',
		'leftBracket',
		'argActionBlock',
		'rightBracket'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LocalsSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLocalsSpec: self
]

{ #category : #generated }
Antlr4LocalsSpecNode >> argActionBlock [
	^ argActionBlock
]

{ #category : #generated }
Antlr4LocalsSpecNode >> argActionBlock: aSmaCCToken [
	argActionBlock := aSmaCCToken
]

{ #category : #generated }
Antlr4LocalsSpecNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
Antlr4LocalsSpecNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4LocalsSpecNode >> localsToken [
	^ localsToken
]

{ #category : #generated }
Antlr4LocalsSpecNode >> localsToken: aSmaCCToken [
	localsToken := aSmaCCToken
]

{ #category : #generated }
Antlr4LocalsSpecNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
Antlr4LocalsSpecNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4LocalsSpecNode >> tokenVariables [
	^ #(#localsToken #leftBracket #argActionBlock #rightBracket)
]
