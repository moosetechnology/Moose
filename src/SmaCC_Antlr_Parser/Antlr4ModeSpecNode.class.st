Class {
	#name : #Antlr4ModeSpecNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'modeToken',
		'nameToken',
		'semicolon',
		'lexerRules'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ModeSpecNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitModeSpec: self
]

{ #category : #generated }
Antlr4ModeSpecNode >> compositeNodeVariables [
	^ #(#lexerRules)
]

{ #category : #'generated-initialize-release' }
Antlr4ModeSpecNode >> initialize [
	super initialize.
	lexerRules := OrderedCollection new: 2.
]

{ #category : #generated }
Antlr4ModeSpecNode >> lexerRules [
	^ lexerRules
]

{ #category : #generated }
Antlr4ModeSpecNode >> lexerRules: anOrderedCollection [
	self setParents: self lexerRules to: nil.
	lexerRules := anOrderedCollection.
	self setParents: self lexerRules to: self
]

{ #category : #generated }
Antlr4ModeSpecNode >> modeToken [
	^ modeToken
]

{ #category : #generated }
Antlr4ModeSpecNode >> modeToken: aSmaCCToken [
	modeToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ModeSpecNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4ModeSpecNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ModeSpecNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
Antlr4ModeSpecNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
Antlr4ModeSpecNode >> tokenVariables [
	^ #(#modeToken #nameToken #semicolon)
]
