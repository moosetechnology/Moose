Class {
	#name : #Antlr4BlockNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'leftParen',
		'optionses',
		'actions',
		'colon',
		'elements',
		'bars',
		'rightParen'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4BlockNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitBlock: self
]

{ #category : #generated }
Antlr4BlockNode >> actions [
	^ actions
]

{ #category : #generated }
Antlr4BlockNode >> actions: anOrderedCollection [
	self setParents: self actions to: nil.
	actions := anOrderedCollection.
	self setParents: self actions to: self
]

{ #category : #generated }
Antlr4BlockNode >> bars [
	^ bars
]

{ #category : #generated }
Antlr4BlockNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
Antlr4BlockNode >> colon [
	^ colon
]

{ #category : #generated }
Antlr4BlockNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
Antlr4BlockNode >> compositeNodeVariables [
	^ #(#elements #optionses #actions)
]

{ #category : #generated }
Antlr4BlockNode >> compositeTokenVariables [
	^ #(#bars)
]

{ #category : #generated }
Antlr4BlockNode >> elements [
	^ elements
]

{ #category : #generated }
Antlr4BlockNode >> elements: anOrderedCollection [
	self setParents: self elements to: nil.
	elements := anOrderedCollection.
	self setParents: self elements to: self
]

{ #category : #'generated-initialize-release' }
Antlr4BlockNode >> initialize [
	super initialize.
	elements := OrderedCollection new: 2.
	optionses := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
	actions := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4BlockNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
Antlr4BlockNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
Antlr4BlockNode >> optionses [
	^ optionses
]

{ #category : #generated }
Antlr4BlockNode >> optionses: anOrderedCollection [
	self setParents: self optionses to: nil.
	optionses := anOrderedCollection.
	self setParents: self optionses to: self
]

{ #category : #generated }
Antlr4BlockNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
Antlr4BlockNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
Antlr4BlockNode >> tokenVariables [
	^ #(#leftParen #rightParen #colon)
]
