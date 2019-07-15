Class {
	#name : #Antlr4LexerAtomNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'dot',
		'options'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerAtomNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerAtom: self
]

{ #category : #generated }
Antlr4LexerAtomNode >> dot [
	^ dot
]

{ #category : #generated }
Antlr4LexerAtomNode >> dot: aSmaCCToken [
	dot := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerAtomNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4LexerAtomNode >> options [
	^ options
]

{ #category : #generated }
Antlr4LexerAtomNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4LexerAtomNode >> tokenVariables [
	^ #(#dot)
]
