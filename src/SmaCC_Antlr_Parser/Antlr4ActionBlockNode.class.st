Class {
	#name : #Antlr4ActionBlockNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'leftBrace',
		'actionBlock',
		'rightBrace'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ActionBlockNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitActionBlock: self
]

{ #category : #generated }
Antlr4ActionBlockNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4ActionBlockNode >> actionBlock: aSmaCCToken [
	actionBlock := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionBlockNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
Antlr4ActionBlockNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionBlockNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
Antlr4ActionBlockNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionBlockNode >> tokenVariables [
	^ #(#leftBrace #actionBlock #rightBrace)
]
