Class {
	#name : #Antlr4FinallyClauseNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'finallyToken',
		'actionBlock'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4FinallyClauseNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitFinallyClause: self
]

{ #category : #generated }
Antlr4FinallyClauseNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4FinallyClauseNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4FinallyClauseNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
Antlr4FinallyClauseNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
Antlr4FinallyClauseNode >> nodeVariables [
	^ #(#actionBlock)
]

{ #category : #generated }
Antlr4FinallyClauseNode >> tokenVariables [
	^ #(#finallyToken)
]
