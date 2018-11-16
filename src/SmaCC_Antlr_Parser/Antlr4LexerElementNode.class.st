Class {
	#name : #Antlr4LexerElementNode,
	#superclass : #Antlr4GrammarNode,
	#instVars : [
		'labeledLexerElement',
		'suffix',
		'expression',
		'actionBlock',
		'questionMark'
	],
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4LexerElementNode >> acceptVisitor: aGrammarVisitor [
	^ aGrammarVisitor visitLexerElement: self
]

{ #category : #generated }
Antlr4LexerElementNode >> actionBlock [
	^ actionBlock
]

{ #category : #generated }
Antlr4LexerElementNode >> actionBlock: anAntlr4ActionBlockNode [
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: nil ].
	actionBlock := anAntlr4ActionBlockNode.
	self actionBlock notNil
		ifTrue: [ self actionBlock parent: self ]
]

{ #category : #generated }
Antlr4LexerElementNode >> expression [
	^ expression
]

{ #category : #generated }
Antlr4LexerElementNode >> expression: anAntlr4GrammarNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := anAntlr4GrammarNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
Antlr4LexerElementNode >> labeledLexerElement [
	^ labeledLexerElement
]

{ #category : #generated }
Antlr4LexerElementNode >> labeledLexerElement: anAntlr4LabeledLexerElementNode [
	self labeledLexerElement notNil
		ifTrue: [ self labeledLexerElement parent: nil ].
	labeledLexerElement := anAntlr4LabeledLexerElementNode.
	self labeledLexerElement notNil
		ifTrue: [ self labeledLexerElement parent: self ]
]

{ #category : #generated }
Antlr4LexerElementNode >> nodeVariables [
	^ #(#labeledLexerElement #suffix #expression #actionBlock)
]

{ #category : #generated }
Antlr4LexerElementNode >> questionMark [
	^ questionMark
]

{ #category : #generated }
Antlr4LexerElementNode >> questionMark: aSmaCCToken [
	questionMark := aSmaCCToken
]

{ #category : #generated }
Antlr4LexerElementNode >> suffix [
	^ suffix
]

{ #category : #generated }
Antlr4LexerElementNode >> suffix: anAntlr4EbnfSuffixNode [
	self suffix notNil
		ifTrue: [ self suffix parent: nil ].
	suffix := anAntlr4EbnfSuffixNode.
	self suffix notNil
		ifTrue: [ self suffix parent: self ]
]

{ #category : #generated }
Antlr4LexerElementNode >> tokenVariables [
	^ #(#questionMark)
]
