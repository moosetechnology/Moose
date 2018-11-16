Class {
	#name : #Antlr4RuleActionNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'atToken',
		'nameToken',
		'actionBlock'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4RuleActionNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitRuleAction: self
]

{ #category : #generated }
Antlr4RuleActionNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4RuleActionNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4RuleActionNode >> atToken [
	^ atToken
]

{ #category : #generated }
Antlr4RuleActionNode >> atToken: aSmaCCToken [
	atToken := aSmaCCToken
]

{ #category : #generated }
Antlr4RuleActionNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4RuleActionNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4RuleActionNode >> nodeVariables [
	^ #(#actionBlock)
]

{ #category : #generated }
Antlr4RuleActionNode >> tokenVariables [
	^ #(#atToken #nameToken)
]
