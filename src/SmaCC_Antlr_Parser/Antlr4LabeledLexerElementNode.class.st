Class {
	#name : #Antlr4LabeledLexerElementNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'equal',
		'expression'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LabeledLexerElementNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLabeledLexerElement: self
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> equal [
	^ equal
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> expression [
	^ expression
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> expression: anAntlr4GrammarNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := anAntlr4GrammarNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
Antlr4LabeledLexerElementNode >> tokenVariables [
	^ #(#nameToken #equal)
]
