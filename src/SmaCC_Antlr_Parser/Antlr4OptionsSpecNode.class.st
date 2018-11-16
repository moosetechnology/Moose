Class {
	#name : #Antlr4OptionsSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'optionsToken',
		'leftBrace',
		'options',
		'semicolons',
		'rightBrace'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4OptionsSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitOptionsSpec: self
]

{ #category : #generated }
Antlr4OptionsSpecNode >> compositeNodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4OptionsSpecNode >> compositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
Antlr4OptionsSpecNode >> initialize [
	super initialize.
	options := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4OptionsSpecNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
Antlr4OptionsSpecNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4OptionsSpecNode >> options [
	^ options
]

{ #category : #generated }
Antlr4OptionsSpecNode >> options: anOrderedCollection [
	self setParents: self options to: nil.
	options := anOrderedCollection.
	self setParents: self options to: self
]

{ #category : #generated }
Antlr4OptionsSpecNode >> optionsToken [
	^ optionsToken
]

{ #category : #generated }
Antlr4OptionsSpecNode >> optionsToken: aSmaCCToken [
	optionsToken := aSmaCCToken
]

{ #category : #generated }
Antlr4OptionsSpecNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
Antlr4OptionsSpecNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4OptionsSpecNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
Antlr4OptionsSpecNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
Antlr4OptionsSpecNode >> tokenVariables [
	^ #(#optionsToken #leftBrace #rightBrace)
]
