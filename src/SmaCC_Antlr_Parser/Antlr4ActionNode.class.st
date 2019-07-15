Class {
	#name : #Antlr4ActionNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'atToken',
		'scopeName',
		'colonColon',
		'nameToken',
		'actionBlock'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4ActionNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitAction: self
]

{ #category : #generated }
Antlr4ActionNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4ActionNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4ActionNode >> atToken [
	^ atToken
]

{ #category : #generated }
Antlr4ActionNode >> atToken: aSmaCCToken [
	atToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionNode >> colonColon [
	^ colonColon
]

{ #category : #generated }
Antlr4ActionNode >> colonColon: aSmaCCToken [
	colonColon := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4ActionNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionNode >> nodeVariables [
	^ #(#actionBlock)
]

{ #category : #generated }
Antlr4ActionNode >> scopeName [
	^ scopeName
]

{ #category : #generated }
Antlr4ActionNode >> scopeName: aSmaCCToken [
	scopeName := aSmaCCToken
]

{ #category : #generated }
Antlr4ActionNode >> tokenVariables [
	^ #(#atToken #nameToken #scopeName #colonColon)
]
