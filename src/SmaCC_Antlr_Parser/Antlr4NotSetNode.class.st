Class {
	#name : #Antlr4NotSetNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'tilde',
		'expression'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4NotSetNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitNotSet: self
]

{ #category : #generated }
Antlr4NotSetNode >> expression [
	^ expression
]

{ #category : #generated }
Antlr4NotSetNode >> expression: anAntlr4GrammarNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := anAntlr4GrammarNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
Antlr4NotSetNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
Antlr4NotSetNode >> tilde [
	^ tilde
]

{ #category : #generated }
Antlr4NotSetNode >> tilde: aSmaCCToken [
	tilde := aSmaCCToken
]

{ #category : #generated }
Antlr4NotSetNode >> tokenVariables [
	^ #(#tilde)
]
