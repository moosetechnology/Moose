Class {
	#name : #Antlr4EbnfNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'block',
		'suffix'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4EbnfNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitEbnf: self
]

{ #category : #generated }
Antlr4EbnfNode >> block [
	^ block
]

{ #category : #generated }
Antlr4EbnfNode >> block: anAntlr4BlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := anAntlr4BlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
Antlr4EbnfNode >> nodeVariables [
	^ #(#block #suffix)
]

{ #category : #generated }
Antlr4EbnfNode >> suffix [
	^ suffix
]

{ #category : #generated }
Antlr4EbnfNode >> suffix: anAntlr4EbnfSuffixNode [
	self suffix notNil
		ifTrue: [ self suffix parent: nil ].
	suffix := anAntlr4EbnfSuffixNode.
	self suffix notNil
		ifTrue: [ self suffix parent: self ]
]
