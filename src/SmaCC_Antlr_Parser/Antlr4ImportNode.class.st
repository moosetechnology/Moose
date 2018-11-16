Class {
	#name : #Antlr4ImportNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'importToken',
		'imports',
		'commas',
		'semicolon'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ImportNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitImport: self
]

{ #category : #generated }
Antlr4ImportNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4ImportNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4ImportNode >> compositeNodeVariables [
	^ #(#imports)
]

{ #category : #generated }
Antlr4ImportNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
Antlr4ImportNode >> importToken [
	^ importToken
]

{ #category : #generated }
Antlr4ImportNode >> importToken: aSmaCCToken [
	importToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ImportNode >> imports [
	^ imports
]

{ #category : #generated }
Antlr4ImportNode >> imports: anOrderedCollection [
	self setParents: self imports to: nil.
	imports := anOrderedCollection.
	self setParents: self imports to: self
]

{ #category : #'generated-initialize-release' }
Antlr4ImportNode >> initialize [
	super initialize.
	imports := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ImportNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
Antlr4ImportNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
Antlr4ImportNode >> tokenVariables [
	^ #(#importToken #semicolon)
]
