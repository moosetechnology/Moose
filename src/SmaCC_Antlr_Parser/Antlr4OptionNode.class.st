Class {
	#name : #Antlr4OptionNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'nameToken',
		'equal',
		'value'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4OptionNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitOption: self
]

{ #category : #generated }
Antlr4OptionNode >> equal [
	^ equal
]

{ #category : #generated }
Antlr4OptionNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
Antlr4OptionNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
Antlr4OptionNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
Antlr4OptionNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
Antlr4OptionNode >> tokenVariables [
	^ #(#nameToken #equal)
]

{ #category : #generated }
Antlr4OptionNode >> value [
	^ value
]

{ #category : #generated }
Antlr4OptionNode >> value: anAntlr4GrammarNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := anAntlr4GrammarNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
