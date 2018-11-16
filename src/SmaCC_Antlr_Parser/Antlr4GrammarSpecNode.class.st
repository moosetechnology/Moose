Class {
	#name : #Antlr4GrammarSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'grammarTypeToken',
		'grammarToken',
		'nameToken',
		'semicolon',
		'prequels',
		'rules',
		'modes'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4GrammarSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitGrammarSpec: self
]

{ #category : #generated }
Antlr4GrammarSpecNode >> compositeNodeVariables [
	^ #(#prequels #rules #modes)
]

{ #category : #generated }
Antlr4GrammarSpecNode >> grammarToken [
	^ grammarToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> grammarToken: aSmaCCToken [
	grammarToken := aSmaCCToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> grammarTypeToken [
	^ grammarTypeToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> grammarTypeToken: aSmaCCToken [
	grammarTypeToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
Antlr4GrammarSpecNode >> initialize [
	super initialize.
	prequels := OrderedCollection new: 2.
	rules := OrderedCollection new: 2.
	modes := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4GrammarSpecNode >> modes [
	^ modes
]

{ #category : #generated }
Antlr4GrammarSpecNode >> modes: anOrderedCollection [
	self setParents: self modes to: nil.
	modes := anOrderedCollection.
	self setParents: self modes to: self
]

{ #category : #generated }
Antlr4GrammarSpecNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> prequels [
	^ prequels
]

{ #category : #generated }
Antlr4GrammarSpecNode >> prequels: anOrderedCollection [
	self setParents: self prequels to: nil.
	prequels := anOrderedCollection.
	self setParents: self prequels to: self
]

{ #category : #generated }
Antlr4GrammarSpecNode >> rules [
	^ rules
]

{ #category : #generated }
Antlr4GrammarSpecNode >> rules: anOrderedCollection [
	self setParents: self rules to: nil.
	rules := anOrderedCollection.
	self setParents: self rules to: self
]

{ #category : #generated }
Antlr4GrammarSpecNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
Antlr4GrammarSpecNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
Antlr4GrammarSpecNode >> tokenVariables [
	^ #(#grammarTypeToken #grammarToken #nameToken #semicolon)
]
