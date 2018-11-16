Class {
	#name : #Antlr4ElementOptionsNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'lt',
		'nameTokens',
		'equals',
		'values',
		'commas',
		'gt'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ElementOptionsNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitElementOptions: self
]

{ #category : #generated }
Antlr4ElementOptionsNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4ElementOptionsNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4ElementOptionsNode >> compositeTokenVariables [
	^ #(#nameTokens #equals #values #commas)
]

{ #category : #generated }
Antlr4ElementOptionsNode >> equals [
	^ equals
]

{ #category : #generated }
Antlr4ElementOptionsNode >> equals: anOrderedCollection [
	equals := anOrderedCollection
]

{ #category : #generated }
Antlr4ElementOptionsNode >> gt [
	^ gt
]

{ #category : #generated }
Antlr4ElementOptionsNode >> gt: aSmaCCToken [
	gt := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
Antlr4ElementOptionsNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	equals := OrderedCollection new: 2.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ElementOptionsNode >> lt [
	^ lt
]

{ #category : #generated }
Antlr4ElementOptionsNode >> lt: aSmaCCToken [
	lt := aSmaCCToken
]

{ #category : #generated }
Antlr4ElementOptionsNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4ElementOptionsNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4ElementOptionsNode >> tokenVariables [
	^ #(#lt #gt)
]

{ #category : #generated }
Antlr4ElementOptionsNode >> values [
	^ values
]

{ #category : #generated }
Antlr4ElementOptionsNode >> values: anOrderedCollection [
	values := anOrderedCollection
]
