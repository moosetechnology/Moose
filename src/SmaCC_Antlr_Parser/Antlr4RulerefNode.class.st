Class {
	#name : #Antlr4RulerefNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'leftBracket',
		'argActionBlock',
		'rightBracket',
		'options'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4RulerefNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitRuleref: self
]

{ #category : #generated }
Antlr4RulerefNode >> argActionBlock [
	^ argActionBlock
]

{ #category : #generated }
Antlr4RulerefNode >> argActionBlock: aSmaCCToken [
	argActionBlock := aSmaCCToken
]

{ #category : #generated }
Antlr4RulerefNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
Antlr4RulerefNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4RulerefNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4RulerefNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4RulerefNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4RulerefNode >> options [
	^ options
]

{ #category : #generated }
Antlr4RulerefNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4RulerefNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
Antlr4RulerefNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
Antlr4RulerefNode >> tokenVariables [
	^ #(#nameToken #leftBracket #argActionBlock #rightBracket)
]
