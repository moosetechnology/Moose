Class {
	#name : #Antlr4AtomNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'dot',
		'options'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4AtomNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitAtom: self
]

{ #category : #generated }
Antlr4AtomNode >> dot [
	^ dot
]

{ #category : #generated }
Antlr4AtomNode >> dot: aSmaCCToken [
	dot := aSmaCCToken
]

{ #category : #generated }
Antlr4AtomNode >> nodeVariables [
	^ #(#options)
]

{ #category : #generated }
Antlr4AtomNode >> options [
	^ options
]

{ #category : #generated }
Antlr4AtomNode >> options: anAntlr4ElementOptionsNode [
	self options notNil
		ifTrue: [ self options parent: nil ].
	options := anAntlr4ElementOptionsNode.
	self options notNil
		ifTrue: [ self options parent: self ]
]

{ #category : #generated }
Antlr4AtomNode >> tokenVariables [
	^ #(#dot)
]
