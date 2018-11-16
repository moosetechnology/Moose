Class {
	#name : #Antlr4ThrowsSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'throwsToken',
		'nameTokens',
		'commas'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ThrowsSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitThrowsSpec: self
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> compositeTokenVariables [
	^ #(#nameTokens #commas)
]

{ #category : #'generated-initialize-release' }
Antlr4ThrowsSpecNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> throwsToken [
	^ throwsToken
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> throwsToken: aSmaCCToken [
	throwsToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ThrowsSpecNode >> tokenVariables [
	^ #(#throwsToken)
]
