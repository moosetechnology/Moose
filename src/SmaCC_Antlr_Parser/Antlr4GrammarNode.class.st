Class {
	#name : #Antlr4GrammarNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4GrammarNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitGrammar: self
]
