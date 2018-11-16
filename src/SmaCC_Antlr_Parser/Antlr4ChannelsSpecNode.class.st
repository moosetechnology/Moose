Class {
	#name : #Antlr4ChannelsSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'channelsToken',
		'leftBrace',
		'nameTokens',
		'commas',
		'rightBrace'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ChannelsSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitChannelsSpec: self
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> channelsToken [
	^ channelsToken
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> channelsToken: aSmaCCToken [
	channelsToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> commas [
	^ commas
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> compositeTokenVariables [
	^ #(#nameTokens #commas)
]

{ #category : #'generated-initialize-release' }
Antlr4ChannelsSpecNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
Antlr4ChannelsSpecNode >> tokenVariables [
	^ #(#channelsToken #leftBrace #rightBrace)
]
