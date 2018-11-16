Class {
	#name : #Antlr4BlockSetNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'leftParen',
		'expressions',
		'bars',
		'rightParen'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4BlockSetNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitBlockSet: self
]

{ #category : #generated }
Antlr4BlockSetNode >> bars [
	^ bars
]

{ #category : #generated }
Antlr4BlockSetNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
Antlr4BlockSetNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
Antlr4BlockSetNode >> compositeTokenVariables [
	^ #(#bars)
]

{ #category : #generated }
Antlr4BlockSetNode >> expressions [
	^ expressions
]

{ #category : #generated }
Antlr4BlockSetNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
Antlr4BlockSetNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4BlockSetNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
Antlr4BlockSetNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
Antlr4BlockSetNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
Antlr4BlockSetNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
Antlr4BlockSetNode >> tokenVariables [
	^ #(#leftParen #rightParen)
]
