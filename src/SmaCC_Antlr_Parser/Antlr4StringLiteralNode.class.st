Class {
	#name : #Antlr4StringLiteralNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4StringLiteralNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitStringLiteral: self
]

{ #category : #generated }
Antlr4StringLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
Antlr4StringLiteralNode >> value [
	^ value
]

{ #category : #generated }
Antlr4StringLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
