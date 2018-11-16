Class {
	#name : #Antlr4EbnfSuffixNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'countToken',
		'nonGreedyToken'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4EbnfSuffixNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitEbnfSuffix: self
]

{ #category : #generated }
Antlr4EbnfSuffixNode >> countToken [
	^ countToken
]

{ #category : #generated }
Antlr4EbnfSuffixNode >> countToken: aSmaCCToken [
	countToken := aSmaCCToken
]

{ #category : #generated }
Antlr4EbnfSuffixNode >> nonGreedyToken [
	^ nonGreedyToken
]

{ #category : #generated }
Antlr4EbnfSuffixNode >> nonGreedyToken: aSmaCCToken [
	nonGreedyToken := aSmaCCToken
]

{ #category : #generated }
Antlr4EbnfSuffixNode >> tokenVariables [
	^ #(#countToken #nonGreedyToken)
]
