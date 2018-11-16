Class {
	#name : #Antlr4ParserRuleSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'modifiers',
		'nameTokens',
		'leftBrackets',
		'argActionBlocks',
		'rightBrackets',
		'returnsToken',
		'throws',
		'locals',
		'prequels',
		'colon',
		'optionses',
		'elements',
		'pounds',
		'bars',
		'semicolon',
		'handlers',
		'finally'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ParserRuleSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitParserRuleSpec: self
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> argActionBlocks [
	^ argActionBlocks
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> argActionBlocks: anOrderedCollection [
	argActionBlocks := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> bars [
	^ bars
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> bars: anOrderedCollection [
	bars := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> colon [
	^ colon
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> compositeNodeVariables [
	^ #(#prequels #elements #optionses #handlers)
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> compositeTokenVariables [
	^ #(#nameTokens #pounds #bars #leftBrackets #argActionBlocks #rightBrackets #modifiers)
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> elements [
	^ elements
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> elements: anOrderedCollection [
	self setParents: self elements to: nil.
	elements := anOrderedCollection.
	self setParents: self elements to: self
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> finally [
	^ finally
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> finally: anAntlr4FinallyClauseNode [
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := anAntlr4FinallyClauseNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> handlers [
	^ handlers
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> handlers: anOrderedCollection [
	self setParents: self handlers to: nil.
	handlers := anOrderedCollection.
	self setParents: self handlers to: self
]

{ #category : #'generated-initialize-release' }
Antlr4ParserRuleSpecNode >> initialize [
	super initialize.
	nameTokens := OrderedCollection new: 2.
	prequels := OrderedCollection new: 2.
	elements := OrderedCollection new: 2.
	optionses := OrderedCollection new: 2.
	pounds := OrderedCollection new: 2.
	bars := OrderedCollection new: 2.
	handlers := OrderedCollection new: 2.
	leftBrackets := OrderedCollection new: 2.
	argActionBlocks := OrderedCollection new: 2.
	rightBrackets := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> leftBrackets [
	^ leftBrackets
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> leftBrackets: anOrderedCollection [
	leftBrackets := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> locals [
	^ locals
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> locals: anAntlr4LocalsSpecNode [
	self locals notNil
		ifTrue: [ self locals parent: nil ].
	locals := anAntlr4LocalsSpecNode.
	self locals notNil
		ifTrue: [ self locals parent: self ]
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> nodeVariables [
	^ #(#locals #finally #throws)
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> optionses [
	^ optionses
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> optionses: anOrderedCollection [
	self setParents: self optionses to: nil.
	optionses := anOrderedCollection.
	self setParents: self optionses to: self
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> pounds [
	^ pounds
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> pounds: anOrderedCollection [
	pounds := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> prequels [
	^ prequels
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> prequels: anOrderedCollection [
	self setParents: self prequels to: nil.
	prequels := anOrderedCollection.
	self setParents: self prequels to: self
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> returnsToken [
	^ returnsToken
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> returnsToken: aSmaCCToken [
	returnsToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> rightBrackets [
	^ rightBrackets
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> rightBrackets: anOrderedCollection [
	rightBrackets := anOrderedCollection
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> throws [
	^ throws
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> throws: anAntlr4ThrowsSpecNode [
	self throws notNil
		ifTrue: [ self throws parent: nil ].
	throws := anAntlr4ThrowsSpecNode.
	self throws notNil
		ifTrue: [ self throws parent: self ]
]

{ #category : #generated }
Antlr4ParserRuleSpecNode >> tokenVariables [
	^ #(#colon #semicolon #returnsToken)
]
