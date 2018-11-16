Class {
	#name : #Antlr4IntegerLiteralNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'value'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4IntegerLiteralNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitIntegerLiteral: self
]

{ #category : #generated }
Antlr4IntegerLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
Antlr4IntegerLiteralNode >> value [
	^ value
]

{ #category : #generated }
Antlr4IntegerLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
